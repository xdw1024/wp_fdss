<?php
/**
 * 地图人员轨迹控制器
 *
 * @author  xdw
 * @date  20170222
 */
namespace app\admin\controller;

use app\admin\model\MyMap;
use app\admin\model\UnitType;
use think\Db;
use app\admin\model\Unit as UnitModel;
use app\admin\model\UnitType as UnitTypeModel;

/**
 * 地图人员轨迹控制器
 *
 * @author  xdw
 * @date  20170222
 */
class MapPersonLine extends Common
{

    /**
     * 区域浏览
     *
     * @author  xdw
     * @date  20161129
     */
    public function index()
    {
        $department = db('admin_department')->select();
        $persons = db('app_user')->select();
        $this->assign('department', $department);
        $this->assign('persons', str_replace('"', '\'', json_encode($persons)));
        return $this->fetch('mappersonline/index');
    }

    /**
     * 显示地图
     *
     * @author xdw
     * @date 20170223
     * @return mixed
     */
    public function showMap()
    {
        $x_point = input('get.x_point');
        $y_point = input('get.y_point');
        $cityName = input('post.cityName');
        $points = $this->getAllUnit();
        $persons = $this->getAppUserNewLocaltion();

        $this->assign('x_point', $x_point);
        $this->assign('y_point', $y_point);
        $this->assign('cityName', $cityName);
        $this->assign('points', str_replace('"', '\'', json_encode($points)));
        $this->assign('person_points', str_replace('"', '\'', json_encode($persons)));
        return $this->fetch('mappersonline/map');
    }

    /**
     * 获取人员信息
     */
    public function getPersonInfo(){
        $department_type = input('post.department_type');
        $key_word = '%'.input('post.keyword').'%';
        $map_dp = ($department_type)?(($department_type==0)?0:['department_id'=>$department_type]):0;
        $persons = db('app_user')->where($map_dp)->where('account|nickname','like',$key_word)->select();

        return str_replace('"', '\'', json_encode($persons));
    }

    /**
     * 获取人员轨迹
     */
    public function getPersonLocal(){

        $person_id = input("post.person_id");
        $day_time = input("post.day_time");//日期
        $start_time = strtotime($day_time.' '.input("post.start_time"));//开始时刻
        $end_time = strtotime($day_time.' '.input("post.end_time"));//截止时刻

        $person_points = db('app_user_local')
            ->field('time,x_coord,y_coord')
            ->where('user_id',$person_id)
            ->where('time','between',[$start_time,$end_time])
            ->order('time')
            ->select();

        return $person_points;
    }

    /**
     * 获取检查人员最新位置
     */
    public function updateAppUserNewLocaltion(){
        $persons = db('app_user u')
            ->field('u.account,u.nickname username,ul.*')
            ->join('fds_app_user_local ul','ul.user_id = u.id','LEFT')
            ->group('u.id')
            ->select();
        return str_replace('"', '\'', json_encode($persons));
    }

    /**
     * 获取检查人员最新位置
     */
    public function getAppUserNewLocaltion(){

        $persons = db('app_user u')
            ->field('u.account,u.nickname username,ul.*')
            ->join('fds_app_user_local ul','ul.user_id = u.id','LEFT')
            ->group('u.id')
            ->select();

        return $persons;
    }

    /**
     * 获取预警单位的信息
     * @author  xdw
     * @date  20170223
     */
    public function getAllUnit()
    {

        $warning_units = db('warning_unit')->select();
        $warning_unit_id = '0';
        foreach ($warning_units as $warning_unit) {
            $warning_unit_id .= ',' . $warning_unit['unit_id'];
        }
        $unitdatas = new UnitModel();
        $unit = $unitdatas->alias('u')
            ->field('u.*,ut.name unittype,ut.icon icon')
            ->join('fds_unit_type ut', 'ut.id=u.unit_type_id', 'LEFT')
            ->where('u.id', 'in', $warning_unit_id)
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
    public function getUnit()
    {

        //单位类型
        $unit_type = input('?post.unit_type') ? substr(input('post.unit_type'), 0, -1) : '';
        $unit_type_ids = $unit_type;
        $unittypeids = explode(',', $unit_type);
        $unittype = new UnitTypeModel();
        foreach ($unittypeids as $unittypeid) {
            $temp = $unittype->getSelfAndAllSubUnitTypeId($unittypeid);
            if ($temp) {
                $unit_type_ids .= ',' . $temp;
            }
        }

        //预警类型
        $warning_type = input('?post.warning_type') ? input('post.warning_type') : '';
        $task_warning = input('?post.task_warning') ? input('post.task_warning') : '';
        switch ($warning_type) {
            case 0:
                $mapcheck = '0';
                break;
            case 1:
            case 2:
            case 3:
                $mapcheck = 'wu.warning_id = ' . $warning_type;
                break;
            case 4:
                $mapcheck = ($task_warning == 0) ? 'wu.warning_id > 3' : 'wu.warning_id = ' . $task_warning;
                break;
            default:
                break;
        }

        $unit = db('warning_unit wu')
            ->field('u.*,ut.name unittype,ut.icon icon,cr.info crinfo,cr.standard_level standard_level,utl.task_id utltaskid,' .
                'utl.unit_id utlunitid,ust.task_id usttaskid,ust.user_id ustuserid,us.nickname usnickname')
            ->join('fds_unit u', 'wu.unit_id=u.id', 'LEFT')
            ->join('fds_unit_type ut', 'ut.id=u.unit_type_id', 'LEFT')
            ->join('fds_check_record cr', 'cr.unit_id=u.id', 'LEFT')
            ->join('fds_task_unit_link utl', 'utl.unit_id = u.id', 'LEFT')
            ->join('fds_task_user_link ust', 'ust.task_id = utl.task_id', 'LEFT')
            ->join('fds_app_user us', 'us.id = ust.user_id', 'LEFT')
            ->where('ut.id', 'in', $unit_type_ids)
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
    public function getArea()
    {
        $administrative_area = Db::name('administrative_area')->select();
        $this->assign('area_info', $administrative_area);
        return $this->fetch('mappersonline/getarea');
    }

    /**
     * 获取自定义区域
     * @
     */
    public function getMyArea()
    {
        $myMap = new MyMap();
        $area_info = $myMap->getAreas();
        $this->assign('area_info', $area_info);
        return $this->fetch('mappersonline/getmyarea');
    }

}
