<?php
/**
 * 任务控制器
 *
 * @author  xdw
 * @date  20161119
 */
namespace app\admin\controller;

use app\admin\model\Task as TaskModel;
use app\admin\model\AppUser as AppUserModel;
use app\admin\model\TaskUserLink as TaskUserLinkModel;
use app\admin\model\TaskUnitLink as TaskUnitLinkModel;
use app\admin\model\Unit as UnitModel;
use app\admin\model\User as UserModel;
use app\admin\model\UnitType as UnitTypeModel;
/**
 * 任务控制器
 *
 * @author  xdw
 * @date  20161119
 */
class Task extends Common
{
    protected $task;
    public function _initialize()
    {
        parent::_initialize();
        $this->task = new TaskModel();
    }

    /**
     * 任务列表
     *
     * @author  xdw
     * @date  20161119
     */
    public function index()
    {
        $link_user = new TaskUserLinkModel();
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $start_time = input('?post.taskstart_time')?input('post.taskstart_time'):'';//开始时间
        $end_time = input('?post.taskend_time')?input('post.taskend_time'):'';//截止时间
        $complete = input('?post.complete')?input('post.complete'):'';//完成情况
        if(!empty($start_time)){
            $mapstart_time = ' and start_time >= '.strtotime($start_time).'';
        }
        else
        {
            $mapstart_time = ' ';
        }
        if(!empty($end_time)){
            $mapend_time = ' and end_time <= '.strtotime($end_time).'';
        }
        else
        {
            $mapend_time = ' ';
        }
        if(empty($complete)){
            $completevalue = "完成情况";
        }else{
            $completevalue = $complete;
        }
        /**
         * start 修正bug
         * 原：如果任务没有分配人员，创建的任务将无法获取
         * xdw 20161205
         */
        if(empty($complete)){
            //$mapcomplete = 't.id in (select task_id from fds_task_user_link where complete like "%%")';
            $mapcomplete = '';
        }elseif($complete=="已完成"){
            $mapcomplete = ' and t.id in (select task_id from fds_task_user_link where complete = 1)';
        }else{
            $mapcomplete = ' and t.id in (select task_id from fds_task_user_link where complete = 0)';
        }
        /** end 修改 xdw 20161205 */
        $numPerPage = input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        //$map['name']  = ['like','%'.$keyword.'%'];
        $map = 'name like "%'.$keyword.'%"';
        $currentPage = input('?post.pageNum')?input('post.pageNum'):1;
        $totalCount = $this->task
            //->where(''.$map.' and '.$mapstart_time.' and '.$mapend_time.' and '.$mapcomplete.'')
            ->where(''.$map.$mapstart_time.$mapend_time . $mapcomplete.'')
            ->alias('t')
            ->field('t.*,tu.complete complete')
            ->join('fds_task_user_link tu','tu.task_id=t.id','LEFT')
            ->count();
        $datalist = $this->task
            //->where(''.$map.' and '.$mapstart_time.' and '.$mapend_time.' and '.$mapcomplete.'')
            ->where(''.$map.$mapstart_time.$mapend_time . $mapcomplete.'')
            ->alias('t')
            ->field('t.*,tu.complete complete')
            ->join('fds_task_user_link tu','tu.task_id=t.id','LEFT')
            ->page("$currentPage,$numPerPage")
            ->order('t.id desc')
            ->select();
        $this->assign('datalist',$datalist);
        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('start_time',$start_time);
        $this->assign('end_time',$end_time);
        $this->assign('keyword',$keyword);
        $this->assign('currentPage',$currentPage);
        $this->assign('complete',$complete);
        return $this->fetch();
    }

    /**
     * 新增/编辑
     * @return mixed
     * @author xdw
     */
    public function edit()
    {
        if(empty(input('tid'))){
            $task_id = input('tid');
            $info = $this->task->getTaskInfo($task_id);
            $ckunit_name = "";
            $ckunit_id = "";
            $this->assign('task_id',$task_id);
            $this->assign('ckunit_name',$ckunit_name);
            $this->assign('ckunit_id',$ckunit_id);
            //获取单位回传信息
            $this->assign('info',$info);
        }else{
            $unit = new UnitModel();
            $task_unit_link = new TaskUnitLinkModel();
            $task_id = input('tid');
            $info = $this->task->getTaskInfo($task_id);

            //获取单位回传信息
            $ck_unitid = $task_unit_link->where('task_id',$task_id)->column('unit_id');
            $ckunitname = $unit->where("id in (select unit_id from fds_task_unit_link where task_id =".$task_id.") ")->column('name');
            $ckunit_name = implode(",",$ckunitname);
            $ckunit_id = implode(",",$ck_unitid);

            $this->assign('info',$info);
            $this->assign('task_id',$task_id);
            $this->assign('ckunit_name',$ckunit_name);
            $this->assign('ckunit_id',$ckunit_id);
        }

        return $this->fetch('task/edit');
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
            $task_id = input('post.id');
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
                    failure('请确认时间选择是否正确，任务截止时间不能在任务开始时间前！');
                    die;
                }
            }

            //任务信息保存
            if($task_id>0)
            {
                $result = $this->task->allowField(true)->save($data,['id'=>$task_id]);
            }
            else
            {
                unset($data['id']);
                $result = $this->task->allowField(true)->save($data);
                $task_id = $this->task->id;
            }
            //任务相关人员保存
            $task_user_id = input('post.checkPersonnel_id');
            if($task_id && $task_user_id)
            {
                $task_user = new TaskUserLinkModel();
                $record = $task_user->where('task_id',$task_id)->find();
                if($record)//编辑
                {
                    if(input('post.checkPersonnel_id')){
                        $result = $task_user->save(['task_id'=>$task_id,'user_id'=>$task_user_id],['id'=>$record['id']]);
                    }
                }
                else//新增
                {
                    $result = $task_user->save(['task_id'=>$task_id,'user_id'=>$task_user_id]);
                }
            }
            //任务相关单位信息保存
            $task_unit_ids=input('post.chkunitid');
            $arrayunit_id=explode(",",$task_unit_ids);
            $countunit=count(array_count_values($arrayunit_id));
            if($task_id){
                $task_unit= new TaskUnitLinkModel();
                $res=$task_unit->where('task_id',$task_id)->select();
                if(empty($res)){
                    for($i=0;$i<$countunit;$i++){
                        $task_unit_id=$arrayunit_id[$i];
                        if($task_unit_id){
                            $datas = ['task_id'=>$task_id,'unit_id'=>$task_unit_id];
                            $result = $task_unit->data($datas,true)->isUpdate(false)->save();
                            //return $result;
                        }
                    }
                }elseif($res){//编辑
                    $res = $res ? $res : array();
                    if(input('post.chkunitid')){
                        foreach ($res as $ress){
                            for($i=0;$i<$countunit;){
                                $task_unit_id=$arrayunit_id[$i];
                                if($task_unit_id==$ress['unit_id']){
                                    $reco=1;
                                    $i=$countunit;
                                }else{
                                    $reco=0;
                                    $i++;
                                }
                            }
                            if($reco==1){
                                $datas = ['task_id'=>$task_id,'unit_id'=>$task_unit_id];
                                $result = $task_unit->isUpdate(false)->save($datas,['id'=>$ress['id']]);
                            }else{
                                $array=array('unit_id'=>$ress['unit_id'],'task_id'=>$task_id);
                                $result = $task_unit->where($array)->delete();//剔除不在任务修改后单位中的已选单位

                            }
                        }
                        for($i=0;$i<$countunit;$i++){
                            $task_unit_id=$arrayunit_id[$i];
                            foreach ($res as $resu) {
                                if($task_unit_id==$resu['unit_id']){
                                    $rec=1;
                                }else{
                                    $rec=0;
                                }
                            }
                            if($rec==0){
                                $datas = ['task_id'=>$task_id,'unit_id'=>$task_unit_id];
                                $result = $task_unit->data($datas,true)->isUpdate(false)->save();
                            }
                        }
                    }

                }
            }

            if(false !== $result)
            {
                success('保存成功','task_list','closeCurrent');
            }
            else
            {
                failure('保存失败！');
            }
        }
    }

    /**
     * 信息删除
     * @author xdw
     */
    public function removeInfo()
    {
        $task_id = input('tid');
        $result = $this->task->where('id',$task_id)->delete();
        if(false !== $result)
        {
            success('删除成功','task_list','');
        }
        else
        {
            failure('删除失败！');
        }
    }

    /**
     * 选择任务相关人员
     * @return mixed
     * @author yxf
     */
    public function selectTaskPersonnel()
    {
        //获取人员信息
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $map['account|nickname']  = ['like','%'.$keyword.'%'];
        $AppUser = new AppUserModel();
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'10';//每页条数
        $currentPage = input('?post.pageNum')?input('post.pageNum'):1;
        $totalCount =$AppUser->where($map)->order('id desc')->count();
        $datalist = $AppUser->where($map)->page("$currentPage,$numPerPage")->order('id desc')->select();


        $this->assign('datalist',$datalist);
        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('keyword',$keyword);
        return $this->fetch('task/selecttaskpersonnel');
    }

    /**
     * 选择任务中的检查单位
     * @return mixed
     * @author yxf
     */
    public function selectTaskUnit(){
        //获取单位信息
        $unit = new UnitModel();
        $unit_type = new UnitTypeModel();
        $task_unit_link = new TaskUnitLinkModel();
        $defaultunitid = trim(input('uid'));//
        $defaultunitname = trim(input('uname'));
        $checkunit= input('?post.checkunit')?input('post.checkunit'):$defaultunitid;
        $chkunitname= input('?post.checkunitname')?input('post.checkunitname'):$defaultunitname;
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'10';//每页条数
        $currentPage = input('?post.pageNum')?input('post.pageNum'):1;

        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $unit_type_id = input('?post.unit_type_id')?input('post.unit_type_id'):'';//搜索类型
        $map = 'u.name like "%'.$keyword.'%"';
        if(!empty($unit_type_id)){
            //$utype = $unit_type->where('name','like','%'.$utname.'%')->select();
            //$maptyp = 'u.unit_type_id = '.$utype['0']['id'];
            //获取该单位类型下的所有单位
            $unit_type_model = new UnitTypeModel();
            $unit_type_ids = $unit_type_model->getSelfAndAllSubUnitTypeId($unit_type_id);
            $maptyp = 'u.unit_type_id in ('.$unit_type_ids.')';
        }else{
            //$maptyp = 'u.unit_type_id like "%%"';
            $maptyp = '';
        }
        $totalCount =$unit->alias('u')
            ->where($map)
            ->where($maptyp)
            ->field('u.*,ut.name unittype')
            ->join('fds_unit_type ut','ut.id=u.unit_type_id','LEFT')
            ->count();
        $datalist = $unit->alias('u')
            ->where($map)
            ->where($maptyp)
            ->field('u.*,ut.name unittype')
            ->join('fds_unit_type ut','ut.id=u.unit_type_id','LEFT')
            ->page("$currentPage,$numPerPage")
            ->order('id desc')
            ->select();
        //将单位信息填入显示页面
        $typelist = $unit_type->order('path')->select();
        $this->assign('datalist',$datalist);
        $this->assign('typelist',$typelist);
        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('unit_type_id',$unit_type_id);
        $this->assign('keyword',$keyword);
        $this->assign('checkunit',$checkunit);
        $this->assign('chkunitname',$chkunitname);
        return $this->fetch('task/selecttaskunit');
    }

    /**
     * 显示检查人员轨迹
     * @author xdw
     * @data 20161215
     */
    public function PersonnelTrajectory(){
        return $this->fetch('task/personneltrajectory');
    }
    /** end 显示检查人员轨迹 */

    /**
     * 显示检查人员轨迹地图
     * @author xdw
     * @data 20161215
     */
    public function PTMap(){
        return $this->fetch('task/ptmap');
    }
    /** end 显示检查人员轨迹地图 */
    public function taskinfo()
    {
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $currentPage =  input('?post.pageNum')?input('post.pageNum'):1;//当前页
        $unit = new UnitModel();
        $user = new AppUserModel();
        $taskuser = new TaskUserLinkModel();
        if(empty(input('post.taskid'))){
            $task_id = input('taskid');
        }else{
            $task_id = input('post.taskid');
        }
        $map = ' and name like "%'.$keyword.'%"';
        $taskinfo = $this->task->where('id ='.$task_id.'')->select();
        $user_id = $taskuser->where('task_id ='.$task_id.'')->select();
        if(empty($user_id)){
            $username = "未分配";
        }else {
            $userid = $user_id['0']['user_id'];
            $task_user = $user->where('id =' . $userid)->select();
            $username = $task_user['0']['nickname'];
        }
        $start_time = $taskinfo['0']['start_time'];
        $end_time = $taskinfo['0']['end_time'];
        $info = $unit->where("t.id in (select unit_id from fds_task_unit_link where task_id =".$task_id.")".$map."")
            ->alias('t')
            ->field('t.*,tu.id tu_id,tu.info checkinfo,tu.time time,tu.standard_level standard_level')
            ->join('fds_check_record tu','tu.unit_id=t.id and tu.time >= '.$start_time.' and tu.time <= '.$end_time.'','LEFT')
            ->page("$currentPage,$numPerPage")
            ->order('t.id desc')
            ->select();
        $totalCount = $unit->where("id in(select unit_id from fds_task_unit_link where task_id =".$task_id.")".$map."")->count();
        $this->assign('info',$info);
        $this->assign('totalCount',$totalCount);
        $this->assign('keyword',$keyword);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('taskid',$task_id);
        $this->assign('username',$username);
        return  $this->fetch('task/taskinfo');
    }

}
