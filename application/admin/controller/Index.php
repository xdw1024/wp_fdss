<?php
/**
 * 默认控制器，显示dwz主框架
 *
 * @author  cx
 * @date  20161116
 */
namespace app\admin\controller;

use app\admin\model\UnitType as UnitTypeModel;
use \think\Session;

/**
 * 默认控制器，显示dwz主框架
 *
 * @author  cx
 * @date  20161116
 */
class Index extends Common
{
    /**
     * 显示dwz主框架
     *
     * @author  cx
     * @date  20161116
     */
    public function index()
    {

        $unit_type = new UnitTypeModel();
        $unit_type_info = $unit_type->where('level',2)->select();
        $warning_type_info = db('warning_advance')->where('type',2)->order('id desc')->select();
        $type_id = Session::get('type_id');
        $this->assign('unit_type',$unit_type_info);
        $this->assign('warning_type',$warning_type_info);
        $this->assign('type_id',$type_id);
        return $this->fetch();
    }
}
