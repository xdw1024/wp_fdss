<?php
/**
 * 地图人员定位控制器
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
 * 地图人员定位控制器
 *
 * @author  xdw
 * @date  20170222
 */
class MapPerson extends Common
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
        return $this->fetch('mapperson/index');
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

        $persons = db('app_user u')
            ->field('u.account,u.nickname username,ul.*')
            ->join('fds_app_user_local ul','ul.user_id = u.id','LEFT')
            ->group('u.id')
            ->select();

        $this->assign('x_point', $x_point);
        $this->assign('y_point', $y_point);
        $this->assign('cityName', $cityName);
        $this->assign('person_points', str_replace('"', '\'', json_encode($persons)));
        return $this->fetch('mapperson/map');
    }

    /**
     * 获取检查人员位置
     * @return mixed
     */
    public function getPerson(){

        //预警类型
        $department_id = input('?post.department_id')?input('post.department_id'):'';
        $keyword = input('?post.person_keyword')?input('post.person_keyword'):'';
        $department_map = ($department_id) ? ('u.department_id = '.$department_id) : 0;
        $key_map['account|nickname'] = ['like','%'.$keyword.'%'];


        $persons = db('app_user u')
            ->field('u.account,u.nickname username,ul.*')
            ->join('fds_app_user_local ul','ul.user_id = u.id','LEFT')
            ->where($department_map)
            ->where($key_map)
            ->group('u.id')
            ->select();

        return $persons;
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
        return $persons;
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
        return $this->fetch('mapperson/getarea');
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
        return $this->fetch('mapperson/getmyarea');
    }

}
