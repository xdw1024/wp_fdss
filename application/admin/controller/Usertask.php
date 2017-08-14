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
class Usertask extends Common
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
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $currentPage =  input('?post.pageNum')?input('post.pageNum'):1;//当前页

        $map['account|nickname']  = ['like','%'.$keyword.'%'];
        $data_count = $this->user->where($map)->select();
        $data_list = $this->user->where($map)->page("$currentPage,$numPerPage")->order('id desc')->select();//分页记录集
        $totalCount = count($data_count);//总记录数

        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('datalist',$data_list);
        $this->assign('keyword',$keyword);
        return $this->fetch('usertask/index');
    }

    /**
     * 任务列表页面
     * @return mixed
     * @author yxf
     */
    public function showtask()
    {
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $currentPage =  input('?post.pageNum')?input('post.pageNum'):1;//当前页
        $usertask = new TaskUserLinkModel();
        if(empty(input('post.userid'))){
            $user_id = input('tid');
        }else{
            $user_id = input('post.userid');
        }

        $map = ' and task_id in (select id from fds_task where name like "%'.$keyword.'%")';
        $info = $usertask->where("user_id='{$user_id}'".$map."")
            ->alias('t')
            ->field('t.*,tu.name name,tu.describle describle')
            ->join('fds_task tu','tu.id=t.task_id','LEFT')
            ->page("$currentPage,$numPerPage")
            ->order('t.id desc')
            ->select();
        $totalCount = $usertask->where("user_id='{$user_id}'".$map."")->count();
        $this->assign('info',$info);
        $this->assign('totalCount',$totalCount);
        $this->assign('keyword',$keyword);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('userid',$user_id);
        return  $this->fetch('usertask/showtask');
    }
    public function taskinfo()
    {
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $currentPage =  input('?post.pageNum')?input('post.pageNum'):1;//当前页
        $unit = new UnitModel();
        $user = new AppUserModel();
        if(empty(input('post.taskid'))){
            $task_id = input('taskid');
        }else{
            $task_id = input('post.taskid');
        }
        if(empty(input('post.userid'))){
            $user_id = input('userid');
        }else{
            $user_id = input('post.userid');
        }
        $user_name = $user->where('id = '.$user_id.'')->select();
        $username = $user_name['0']['nickname'];
        $map = ' and name like "%'.$keyword.'%"';
        $task = new TaskModel();
        $taskinfo = $task->where('id ='.$task_id.'')->select();
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
        $this->assign('userid',$user_id);
        $this->assign('username',$username);
        return  $this->fetch('usertask/taskinfo');
    }

}
