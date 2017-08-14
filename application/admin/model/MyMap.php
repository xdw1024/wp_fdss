<?php
namespace app\admin\model;
use think\Exception;

/**
 * 自定义地图区域
 * @author  xdw
 * @date  20170327
 */
class MyMap{

    public $areas;//区域划分集

    //获取所有区域的边界
    public function getAreas(){
        $areas = array();
        for($i=1;$i<10;$i++){
            $file_path = WEB_ROOT .'/public/map_zone/'.$i.".txt";
            try{
                $zone = array();
                $str = file_get_contents($file_path);//将整个文件内容读入到一个字符串中
                $temp = '$zone = array('.$str.');' ;
                eval($temp);
                $areas = array_merge($areas,$zone);
            }
            catch (Exception $e){
                my_logger(strip_tags($e));
            }
        }
        return $areas;
    }

    //获取指定区域边界
    public function getAreaByName($zoneName){

    }

}