<?php
/**
 * 用户任务控制器
 *
 * @author  yxf
 * @date  20161206
 */
namespace app\admin\controller;
use app\admin\model\AppUser as AppUserModel;
use app\admin\model\TaskUserLink;
use app\admin\model\Unit as UnitModel;
use app\admin\model\Task as TaskModel;
use app\admin\model\TaskUserLink as TaskUserLinkModel;
//use app\admin\model\TaskUserLink;

/**
 * 用户控制器
 *
 * @author  xdw
 * @date  20161119
 */
class Chart extends Common
{
    public function _initialize()
    {
        parent::_initialize();
        $this->user = new AppUserModel();
    }

    /**
     * 用户列表
     *
     * @author  yxf
     * @date  20161119
     */
    public function index()
    {
        return  $this->fetch('chart/index');
    }

    public function pie()
    {
        return  $this->fetch('chart/pie');
    }
    public function column()
    {
        return  $this->fetch('chart/column');
    }
}
