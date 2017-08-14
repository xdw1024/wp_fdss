<?php
/**
 * 预警控制器
 *
 * @author  xdw
 * @date  20170204
 */
namespace app\admin\controller;


/**
 * 预警控制器
 *
 * @author  xdw
 * @date  20170204
 */
class Warning extends Common
{
    public function _initialize()
    {
        parent::_initialize();
        $this->zone = db('Zone');
    }

    /**
     * 预警列表
     *
     * @author  xdw
     * @date  20170204
     */
    public function index()
    {
        $warning = db('WarningAdvance');
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $currentPage =  input('?post.pageNum')?input('post.pageNum'):1;//当前页

        $admin_id = $_SESSION['fdss_session']['authId'];
        $department_ids = get_admin_manage_department();
        if($admin_id == 1){
            $department_ids .= ',\'\'' ;
        }
        $map['department_id'] = ['in',$department_ids];
        $map['wa.name']  = ['like','%'.$keyword.'%'];
        $data_count = $warning->where($map)->alias('wa')
            ->join('fds_admin_department ad','wa.department_id = ad.id','LEFT')
            ->where($map)
            ->select();
        $data_list = $warning->where($map)->alias('wa')
            ->field(['wa.*','ad.name'=>'department_name'])
            ->join('fds_admin_department ad','wa.department_id = ad.id','LEFT')
            ->where($map)
            ->page("$currentPage,$numPerPage")
            ->select();//分页记录集
        $totalCount = count($data_count);//总记录数

        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('datalist',$data_list);
        $this->assign('keyword',$keyword);
        return $this->fetch('warning/index');
    }

    /**
     * 新增/编辑 页面
     * @return mixed
     * @author xdw
     */
    public function edit()
    {
        $warning_id = input('uid');
        $warning = db('WarningAdvance');
        $department = db('AdminDepartment');
        $info = $warning->where('id','eq',$warning_id)->find();
        $department = $department->select();
        $this->assign('info',$info);
        $this->assign('department',$department);
//        var_dump($info);die();
        return  $this->fetch('warning/edit');
    }

    /**
     * 信息保存
     * @author xdw
     */
    public function saveInfo()
    {
        $data = input('post.');
        //$validate = $this->validate($data,'Article.saveinfo');
        $validate = true;

        if(true !== $validate)
        {
            $this->error($validate);
        }
        else
        {
            $warning = db('WarningAdvance');

            if(!empty(input('post.start_time'))){
                $data['start_time'] = strtotime($data['start_time']);
            }else{
                $data['start_time'] = null;
            }
            if(!empty(input('post.end_time'))){
                $data['end_time'] = strtotime($data['end_time']);
            }else{
                $data['end_time'] = null;
            }
            if(!empty(input('post.start_time')) && !empty(input('post.end_time'))){
                if(strtotime(input('post.start_time'))>strtotime(input('post.end_time'))){
                    failure('请确认时间选择是否正确，结束时间不能在开始时间前！');
                    die;
                }
            }
            $warning_id = input('post.id');

            if($warning_id>0)//编辑
            {
                //系统预警
                if($warning_id <= 3){
                    $new_data = $this->calculateEndTime($warning_id,$data['start_time'],$data['num_interval']);
                    $data['start_time'] = $new_data['start_time'];
                    $data['end_time'] = $new_data['end_time'];
                }
                //任务预警
                $result = $warning->where('id',$warning_id)->update($data);
            }
            else//新增
            {
                //只添加任务预警
                $data['type'] = 2;
                $result = $warning->insert($data);
            }

            if(false !== $result)
            {
                success('保存成功','warning_list','closeCurrent');
            }
            else
            {
                failure('保存失败');
            }
        }
    }

    /**
     * 计算系统预警的起止时间
     * 这里只计算一次循环预警，下次预警时间由自动检测程序 ..\admin\controller\Cron.php 进行更新
     * @param $type 系统预警类型
     * @param $start_time 初始预警时间
     * @param $interval 时间间隔
     * @return array 截至时间
     */
    private function calculateEndTime($type,$start_time,$interval){
        $time = array();
        switch($type)
        {
            case 1: //年预警
                $start_year = date('Y',$start_time);
                $end_year = $start_year + $interval;
                $time['start_time'] = mktime(0,0,0,1,1,$start_year);
                $time['end_time'] = mktime(0,0,0,1,1,$end_year);
                break;
            case 2: //月预警
                list($start_date['y'],$start_date['m']) = explode("-",date('Y-m',$start_time));
                $end_month = $start_date['m'] + $interval;
                $time['start_time'] = mktime(0,0,0,$start_date['m'],1,$start_date['y']);
                $time['end_time'] = mktime(0,0,0,$end_month,1,$start_date['y']);
                break;
            case 3: //天预警
                list($start_date['y'],$start_date['m'],$start_date['d']) = explode("-",date('Y-m-d',$start_time));
                $end_day = $start_date['d'] + $interval;
                $time['start_time'] =  mktime(0,0,0,$start_date['m'],$start_date['d'],$start_date['y']);
                $time['end_time'] =  mktime(0,0,0,$start_date['m'],$end_day,$start_date['y']);
                break;
            default:
                $time = array();
        }
        return $time;
    }

    /**
     * 信息删除
     * @author xdw
     */
    public function removeInfo()
    {
        $warning_id = input('uid');
        $warning = db('WarningAdvance');
        $result = $warning->where('id',$warning_id)->where('type','neq',1)->delete();
        if(false !== $result)
        {
            success('删除成功','warning_list','');
        }
        else
        {
            failure('删除失败！');
        }
    }


}
