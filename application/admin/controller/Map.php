<?php
/**
 * 地图控制器
 *
 * @author  xdw
 * @date  20161129
 */
namespace app\admin\controller;

use app\admin\model\AdministrativeArea;
use app\admin\model\MyMap;
use app\admin\model\MyMap_2;
use app\admin\model\UnitType;
use think\Db;
use app\admin\model\Unit as UnitModel;
use app\admin\model\UnitType as UnitTypeModel;
use app\admin\model\CheckRecord as CheckRecordModel;
use think\Exception;

/**
 * 地图控制器
 *
 * @author  xdw
 * @date  20161129
 */
class Map extends Common
{

    /**
     * 区域浏览
     *
     * @author  xdw
     * @date  20161129
     */
    public function index()
    {
        $unit_type = new UnitType();
        $unit_type_info = $unit_type->where('level',2)->select();
        $this->assign('unit_type',$unit_type_info);

        $this->assign('numPerPage',3);
        $this->assign('currentPage',1);
        $this->assign('keyword','');

        return $this->fetch('map/index');
    }


    /**
     * 显示地图
     *
     * @author xdw
     * @date 20161129
     * @return mixed
     */
    public function showMap(){

        $x_point = input('get.x_point');
        $y_point = input('get.y_point');
        $cityName = input('post.cityName');
        $points = $this->getAllUnit();

        $this->assign('x_point',$x_point);
        $this->assign('y_point',$y_point);
        $this->assign('cityName',$cityName);
        $this->assign('points',str_replace('"','\'',json_encode($points)));
        return $this->fetch('map/map');
    }

    /**
     * 获取所有单位的信息
     * @author  xdw
     * @date  20161208
     */
    public function getAllUnit(){

        $unitdatas = new UnitModel();
//        $unit =$unitdatas->alias('u')
//            ->field('u.*,ut.name unittype,ut.icon icon')
//            ->join('fds_unit_type ut','ut.id=u.unit_type_id','LEFT')
//            ->select();
        $unit = $unitdatas->alias('u')
            ->field('u.*,GROUP_CONCAT(DISTINCT(au.nickname)) as username,ut.name unittype,ut.icon icon,cr.info crinfo,cr.standard_level standard_level')
            ->join('fds_zone_user zu','zu.unit_type_id = u.unit_type_id AND zu.zone_id = u.zone_id','LEFT')
            ->join('fds_app_user au','au.id = zu.user_id','LEFT')
            ->join('fds_check_record cr', 'cr.unit_id = u.id','LEFT')
            ->join('fds_unit_type ut','ut.id=u.unit_type_id','LEFT')
            ->group('u.id')
            ->select();

        return $unit;
    }

    /**
     * 获取搜索单位的信息
     * @author  xdw
     * @date  20161202
     *
     * update 追加查询字段
     * @author  yxf
     * @date  20161130
     */
    public function getUnit(){

        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $currentPage =  input('?post.pageNum')?input('post.pageNum'):1;//当前页

        //所属区域
        $zone_name = input('?post.zoneName')?input('post.zoneName'):'';
        $zone = db('zone')->where('name',$zone_name)->where('parent_id != 0')->find();
        if(!empty($zone)){
            $mapzone = 'u.zone_id = '.$zone['id'];
        }else{
            $mapzone = '0';
        }

        //单位类型
        $unit_type = input('?post.unit_type')?substr(input('post.unit_type'),0,-1):'';
        $unit_type_ids = $unit_type;
        $unittypeids = explode(',',$unit_type);
        $unittype = new UnitTypeModel();
        foreach ($unittypeids as $unittypeid){
            $temp = $unittype->getSelfAndAllSubUnitTypeId($unittypeid);
            if ($temp)
            {
                $unit_type_ids .= ','.$temp;
            }
        }
        //关键字
        $key_word = input('?post.keyWord')?'%'.input('post.keyWord').'%':'%';
        //检查状态
        $check = input('?post.Check')?input('post.Check'):'';
        if(empty($check)){
            $mapcheck = '0';
        }elseif($check=="1"){
            $mapcheck = 'u.id in (select unit_id from fds_check_record)';
        }else{
            $mapcheck = 'u.id not in (select unit_id from fds_check_record)';
        }
        $unitdatas = new UnitModel();
        //$unit =$unitdatas->alias('u')
        //    ->field('u.*,ut.name unittype,ut.icon icon,cr.info crinfo,cr.standard_level standard_level,utl.task_id utltaskid,'.
        //        'utl.unit_id utlunitid,ust.task_id usttaskid,ust.user_id ustuserid,us.nickname usnickname')
        //    ->join('fds_unit_type ut','ut.id=u.unit_type_id','LEFT')
        //    ->join('fds_check_record cr','cr.unit_id=u.id','LEFT')
        //    ->join('fds_task_unit_link utl','utl.unit_id = u.id','LEFT')
        //    ->join('fds_task_user_link ust','ust.task_id = utl.task_id','LEFT')
        //    ->join('fds_app_user us','us.id = ust.user_id','LEFT')
        //    ->where('u.name','like',$key_word)
        //    ->where('ut.id','in',$unit_type_ids)
        //    ->where($mapcheck)
        //    ->group('u.id')
        //    ->select(false);

        $units = $unitdatas->alias('u')
            ->field('u.*,GROUP_CONCAT(DISTINCT(au.nickname)) as username,ut.name unittype,ut.icon icon,cr.info crinfo,cr.standard_level standard_level')
            ->join('fds_zone_user zu','zu.unit_type_id = u.unit_type_id AND zu.zone_id = u.zone_id','LEFT')
            ->join('fds_app_user au','au.id = zu.user_id','LEFT')
            ->join('fds_check_record cr', 'cr.unit_id = u.id','LEFT')
            ->join('fds_unit_type ut','ut.id=u.unit_type_id','LEFT')
            ->where('u.name','like',$key_word)
            ->where('ut.id','in',$unit_type_ids)
            ->where($mapzone)
            ->where($mapcheck)
            ->group('u.id')
            ->select();

        //统计各分类的单位数量
        $unitTypeModel = new UnitTypeModel();
        $unit_types = db('unit_type')->where('level',2)->select();//获取二级分类
        foreach($unit_types as &$unit_type){
            $unit_type['count'] = 0;
            $unit_type['sub_id'] = array();
            $sub_unit_type_ids = $unitTypeModel->getSelfAndAllSubUnitTypeId($unit_type['id']);
            if($sub_unit_type_ids){
                $unit_type['sub_id'] = explode(',',$sub_unit_type_ids);
            }
        }
        foreach ($units as $item){
            foreach ($unit_types as &$unit_type){
                $flag = in_array($item['unit_type_id'],$unit_type['sub_id']);
                if($flag) {
                    $unit_type['count'] = $unit_type['count'] + 1;
                    continue;
                }
            }
        }

        $data['units'] = $units;
        $data['count'] = $unit_types;
        $data['total_count'] = count($units)?count($units):0;
        $data['keyword'] = $keyword;
        $data['currentPage'] = $currentPage;
        $data['numPerPage'] = $numPerPage;
        //my_logger($data);

        return $data;
    }

    //单位查询分类页
    public function result_page()
    {

    }


    /**
     * 获取单位详细信息
     * @author yxf
     * @date 20170306
     */
    public function getUnitdata(){
        $unit_id = input('post.unitid');
        $unitdatas = new UnitModel();
        $unit = $unitdatas->alias('u')
            ->field('u.id unit_id,uif.name fname,uif.id fid,uid.data data')
            ->join('fds_unit_info_field uif','uif.unit_type_id = u.unit_type_id','LEFT')
            ->join('fds_unit_info_data uid','uid.field_id = uif.id and uid.unit_id = u.id','LEFT')
            ->where('u.id ='.$unit_id)
            ->order('u.id,uid.field_id')
            ->select();
        return $unit;
    }

    /**
     * 获取单位检查记录
     * @author yxf
     * @date 20170308
     */
    public function getUnitcheckrecord(){
        $unit_id = input('post.unitid');
        $checkrecord = new CheckRecordModel();
        $record = $checkrecord->alias('u')
            ->field('u.unit_id unit_id,u.time checktime,u.standard_level standard_level,us.account account,us.nickname checkuser')
            ->join('fds_app_user us','us.id = u.user_id','LEFT')
            ->where('unit_id ='.$unit_id)
            ->order('time desc')
            ->select();
        return $record;
    }

    /**
     * 获取行政区域信息
     * @author xwd
     * @date 20161130
     */
    public function getArea(){
        $administrative_area = Db::name('administrative_area')->select();
        $this->assign('area_info',$administrative_area);
        return $this->fetch('map/getarea');
    }

    /**
     * 获取自定义区域
     * @date 20170326
     */
    public function getMyArea(){
        $myMap = new MyMap();
        $area_info = $myMap->getAreas();
        $zone = db('zone')->select();
        $this->assign('area_info',$area_info);
        $this->assign('zone',$zone);
        return $this->fetch('map/getmyarea');
    }

}
