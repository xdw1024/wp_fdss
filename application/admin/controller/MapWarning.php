<?php
/**
 * 地图预警控制器
 *
 * @author  xdw
 * @date  20170222
 */
namespace app\admin\controller;

use app\admin\model\AdministrativeArea;
use app\admin\model\MyMap;
use app\admin\model\UnitType;
use think\Db;
use app\admin\model\Unit as UnitModel;
use app\admin\model\UnitType as UnitTypeModel;
/**
 * 地图预警控制器
 *
 * @author  xdw
 * @date  20170222
 */
class MapWarning extends Common
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
        $warning_type_info = db('warning_advance')->where('type',2)->order('id desc')->select();
        $this->assign('unit_type',$unit_type_info);
        $this->assign('warning_type',$warning_type_info);
        return $this->fetch('mapwarning/index');
    }

    /**
     * 获取预警类型
     *
     * @author yxf
     * @date 20170310
     */
    public function getWarningtype()
    {
        $unit_id = input('post.unitid');
        $unit_warning_type_info = db('warning_unit')
            ->alias('wu')
            ->field('wu.warning_id,wa.name typename,wa.type')
            ->join('fds_warning_advance wa','wa.id = wu.warning_id','LEFT')
            ->where('unit_id ='.$unit_id)->select();
        return $unit_warning_type_info;
    }

    /**
     * 显示地图
     *
     * @author xdw
     * @date 20170223
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
        return $this->fetch('mapwarning/map');
    }

    /**
     * 获取预警单位的信息
     * @author  xdw
     * @date  20170223
     */
    public function getAllUnit(){

        $warning_units = db('warning_unit')->select();
        $warning_unit_id = '0';
        foreach($warning_units as $warning_unit){
            $warning_unit_id .= ','.$warning_unit['unit_id'];
        }
        $unitdatas = new UnitModel();
//        $unit =$unitdatas->alias('u')
//            ->field('u.*,ut.name unittype,ut.icon icon')
//            ->join('fds_unit_type ut','ut.id=u.unit_type_id','LEFT')
//            ->where('u.id','in',$warning_unit_id)
//            ->select();
        $unit = $unitdatas->alias('u')
            ->field('u.*,GROUP_CONCAT(DISTINCT(au.nickname)) as username,ut.name unittype,ut.icon icon,cr.info crinfo,cr.standard_level standard_level')
            ->join('fds_zone_user zu','zu.unit_type_id = u.unit_type_id AND zu.zone_id = u.zone_id','LEFT')
            ->join('fds_app_user au','au.id = zu.user_id','LEFT')
            ->join('fds_check_record cr', 'cr.unit_id = u.id','LEFT')
            ->join('fds_unit_type ut','ut.id=u.unit_type_id','LEFT')
            ->where('u.id','in',$warning_unit_id)
            ->group('u.id')
            ->select();
        return $unit;
    }

    /**
     * 获取单位信息
     * update 添加查询条件，
     * @author  xdw
     * @date  20161202
     *
     * update 追加查询字段
     * @author  yxf
     * @date  20161130
     */
    public function getUnit(){

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

        //预警类型
        $warning_type = input('?post.warning_type')?input('post.warning_type'):'';
        $task_warning = input('?post.task_warning')?input('post.task_warning'):'';
        switch ($warning_type){
            case 0:
                $mapcheck = '0';
                break;
            case 1:
            case 2:
            case 3:
                $mapcheck = 'wu.warning_id = '.$warning_type;
                break;
            case 4:
                $mapcheck = ($task_warning == 0) ? 'wu.warning_id > 3' : 'wu.warning_id = '.$task_warning;
                break;
            default:
                break;
        }

//        $unit = db('warning_unit wu')
//            ->field('u.*,ut.name unittype,ut.icon icon,cr.info crinfo,cr.standard_level standard_level,utl.task_id utltaskid,'.
//                'utl.unit_id utlunitid,ust.task_id usttaskid,ust.user_id ustuserid,us.nickname usnickname')
//            ->join('fds_unit u','wu.unit_id=u.id','LEFT')
//            ->join('fds_unit_type ut','ut.id=u.unit_type_id','LEFT')
//            ->join('fds_check_record cr','cr.unit_id=u.id','LEFT')
//            ->join('fds_task_unit_link utl','utl.unit_id = u.id','LEFT')
//            ->join('fds_task_user_link ust','ust.task_id = utl.task_id','LEFT')
//            ->join('fds_app_user us','us.id = ust.user_id','LEFT')
//            ->where('ut.id','in',$unit_type_ids)
//            ->where($mapcheck)
//            ->group('u.id')
//            ->select();

        $unit = db('warning_unit wu')
            ->field('u.*,GROUP_CONCAT(DISTINCT(au.nickname)) as username,ut.name unittype,ut.icon icon,cr.info crinfo,cr.standard_level standard_level')
            ->join('fds_unit u','u.id = wu.unit_id','LEFT')
            ->join('fds_zone_user zu','zu.unit_type_id = u.unit_type_id AND zu.zone_id = u.zone_id','LEFT')
            ->join('fds_app_user au','au.id = zu.user_id','LEFT')
            ->join('fds_check_record cr', 'cr.unit_id = u.id','LEFT')
            ->join('fds_unit_type ut','ut.id=u.unit_type_id','LEFT')
            ->where('ut.id','in',$unit_type_ids)
            ->where($mapcheck)
            ->group('u.id')
            ->select();

        return $unit;
    }

    /**
     * 获取行政区域信息
     * @author xwd
     * @date 20161130
     */
    public function getArea(){
        $administrative_area = Db::name('administrative_area')->select();
        $this->assign('area_info',$administrative_area);
        return $this->fetch('mapwarning/getarea');
    }

    /**
     * 获取自定义区域
     * @
     */
    public function getMyArea(){
        $myMap = new MyMap();
        $area_info = $myMap->getAreas();
        $this->assign('area_info',$area_info);
        return $this->fetch('mapwarning/getmyarea');
    }

}
