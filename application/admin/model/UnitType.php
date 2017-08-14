<?php
/**
 *
 * 单位模型
 * 参照dwz_thinkphp官方框架User模型编写，未用到方法已注释
 *
 * @author  xdw
 * @date  20161119
 */
namespace app\admin\model;

use think\Model;

/**
 *
 * 单位模型
 *
 * @author  xdw
 * @date  20161119
 */
class UnitType extends Model {

    /**
     * 根据部门id,获取单位类型id
     * @param $department_id
     * @return false|\PDOStatement|string|\think\Collection
     */
    function getUnitTypeIdByDepartmentId($department_id){
        $unit_type_ids = db('unit_type')->where('department_id','in',$department_id)->column('id');
        return $unit_type_ids;
    }

    /**
     * 判断一个单位类型是否是给定单位类型的子类型
     * @param $parent_id
     * @param $sub_unit_type_id
     * @return bool
     */
    function isSubUnitType($parent_id,$sub_unit_type_id){
        $sub_unit_type = db('unit_type')->where('id',$sub_unit_type_id)->find();
        $parent_unit_type_ids = explode('/',$sub_unit_type['path']);

        return (in_array($parent_id,$parent_unit_type_ids))? true : false;
    }

    /**
     * 根据当前单位类型id,获取下级‘按照树型层级排序’的类型id
     */
    function getUnitTypeTreeId($unitTypeId){
        $unit_type_tree_id = self::getUnitTypeTreeIdStr($unitTypeId);
        return rtrim($unit_type_tree_id,',');
    }

    /**
     * 根据当前单位类型id,获取下级‘按照树型层级排序’的类型id
     * @param $unitTypeId
     * @return string
     */
    function getUnitTypeTreeIdStr($unitTypeId){
        $unit_type_tree_id_str = '';
        $sub_unit_type_id_str = $this->getSubUnitTypeId($unitTypeId);//获取子类型id
        $temp_unit_type_ids = explode(',',$sub_unit_type_id_str);
        foreach ($temp_unit_type_ids as $item){
            if($item)
            {
                $unit_type_tree_id_str .= $item.',';
                //递归调用，获取子级类型
                $unit_type_tree_id_str .= self::getUnitTypeTreeId($item);
            }
        }

        return $unit_type_tree_id_str;
    }


    /**
     * 根据当前单位类型id,获取其‘下一级’类型 id
     * 返回单位类型 id 字符串
     * @param $unitTypeId
     * @return string （下一级类型id）
     */
    function getSubUnitTypeId($unitTypeId){

        $unit_type_id_str = '';
        $unit_type = db('unit_type')->where('parent_id',$unitTypeId)->select();
        foreach($unit_type as $item){
            $unit_type_id_str .= $item['id'].',';
        }
        $unit_type_id_str = rtrim($unit_type_id_str,',');
        return $unit_type_id_str;
    }

    /**
     * 根据当前单位类型id,获取该单位类型及其‘所有下级’类型 id
     * 返回单位类型 id 字符串
     * @param $unitTypeId
     * @return string （当前类型id + 所有子类型id）
     */
    function getSelfAndAllSubUnitTypeId($unitTypeId){

        $unit_type_id_str = $unitTypeId;
        $temp_parent_id = $unitTypeId;
        while($temp_parent_id != null)
        {
            $unit_type = db('unit_type')->where('parent_id','in',$temp_parent_id)->select();
            //print_r($unit_type);
            $temp_parent_id = null;
            foreach($unit_type as $item){
                $unit_type_id_str = $unit_type_id_str.','.$item['id'];
                $temp_parent_id = $temp_parent_id.$item['id'].',';
            }
            $temp_parent_id = rtrim ($temp_parent_id,',');
            //var_dump($unit_type_id);
            //var_dump($temp_parent_id);
        }
        return $unit_type_id_str;
    }


}