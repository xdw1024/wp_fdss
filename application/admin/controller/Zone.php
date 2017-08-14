<?php
/**
 * 区域控制器
 *
 * @author  xdw
 * @date  20170204
 */
namespace app\admin\controller;

use think\Db;

/**
 * 区域控制器
 *
 * @author  xdw
 * @date  20170204
 */
class Zone extends Common
{
    public function _initialize()
    {
        parent::_initialize();
        $this->zone = db('Zone');
    }

    /**
     * 区域列表
     *
     * @author  xdw
     * @date  20170204
     */
    public function index()
    {
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $currentPage =  input('?post.pageNum')?input('post.pageNum'):1;//当前页

        $department_ids = get_admin_manage_department();
        $map['ut.department_id'] = ['in',$department_ids];
        $map['z.name|ut.name|au.nickname']  = ['like','%'.$keyword.'%'];
        //$data_count = $zone->where($map)->select();
        $data_count = Db::view(['fds_zone_user'=>'zu'],'unit_type_id,user_id')
            ->view(['fds_zone'=>'z'],['id','name'=>'zone_name'],'zu.zone_id = z.id','LEFT')
            ->view(['fds_unit_type'=>'ut'],['name'=>'unit_type_name'],'ut.id = zu.unit_type_id','LEFT')
            ->view(['fds_app_user'=>'au'],['GROUP_CONCAT(au.account,\'-\',au.nickname)'=>'user_name'],'au.id = zu.user_id','LEFT')
            ->where($map)
            ->group('z.id,zone_id ,unit_type_id')
            ->select();
        //$data_list = $this->user->where($map)->page("$currentPage,$numPerPage")->order('id desc')->select();//分页记录集
        $data_list = Db::view(['fds_zone_user'=>'zu'],'unit_type_id,user_id')
            ->view(['fds_zone'=>'z'],['id','name'=>'zone_name'],'zu.zone_id = z.id','LEFT')
            ->view(['fds_unit_type'=>'ut'],['name'=>'unit_type_name'],'ut.id = zu.unit_type_id','LEFT')
            ->view(['fds_app_user'=>'au'],['GROUP_CONCAT(au.id)'=>'user_ids','GROUP_CONCAT(au.nickname,\'(\',au.account,\'）\')'=>'user_name'],'au.id = zu.user_id','LEFT')
            ->where($map)
            ->group('z.id,zone_id ,unit_type_id')
            ->page("$currentPage,$numPerPage")
            ->select();//分页记录集
        $totalCount = count($data_count);//总记录数

        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('datalist',$data_list);
        $this->assign('keyword',$keyword);
        return $this->fetch('zone/index');
    }

    /**
     * 新增/编辑 页面
     * @return mixed
     * @author xdw
     */
    public function edit()
    {
        $info = null;
        $action = 'new';//标记，区分新建/修改
        if(input('uid')!=null) {
            $data_id = explode('/', input('uid'));
            $zone_id = $data_id[0];
            $unit_type_id = $data_id[1];
            $user_ids = $data_id[2];
            $info = Db::view(['fds_zone' => 'z'], ['id', 'name' => 'zone_name'])
                ->view(['fds_zone_user' => 'zu'], 'unit_type_id,user_id', 'zu.zone_id = z.id', 'LEFT')
                ->view(['fds_unit_type' => 'ut'], ['name' => 'unit_type_name'], 'ut.id = zu.unit_type_id', 'LEFT')
                ->view(['fds_app_user' => 'au'], ['GROUP_CONCAT(au.id)' => 'user_ids', 'GROUP_CONCAT(au.nickname)' => 'user_name'], 'au.id = zu.user_id', 'LEFT')
                ->where('z.id', 'eq', $zone_id)
                ->where('ut.id', 'eq', $unit_type_id)
                ->group('unit_type_id')
                ->find();//分页记录集
            $action = 'edit';
        }
        $zone = db('zone')->where('id','neq',1)->select();
        $unit_type = db::view('unit_type')->order('path')->select();
        $this->assign('info',$info);
        $this->assign('zone',$zone);
        $this->assign('unit_type',$unit_type);
        $this->assign('action',$action);
        return  $this->fetch('zone/edit');
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
            $action = input('post.action');
            $zone_id = input('post.zone_id');
            $unit_type_id = input('post.unit_type_id');
            $user_ids = input('post.chkuserid');
            $result = db('zone_user')->where('zone_id','eq',$zone_id)->where('unit_type_id','eq',$unit_type_id)->find();
            if($action=='new' && $result)
            {
                failure('该记录已存在！不需要新增,请直接修改原记录');
                exit();
            }
            //删除不在被选队列中的旧数据
            $result = db('zone_user')->where('zone_id','eq',$zone_id)
                ->where('unit_type_id','eq',$unit_type_id)
                ->where('user_id','not in',$user_ids)
                ->delete();
            //插入数据
            foreach ( explode(',',$user_ids) as $user_id){
                 if(!db('zone_user')->where('zone_id','eq',$zone_id)->where('unit_type_id','eq',$unit_type_id)->where('user_id','eq',$user_id)->find()){
                     $data_temp = ['zone_id' => $zone_id, 'user_id' => $user_id, 'unit_type_id' => $unit_type_id];
                     $result = db('zone_user')->insert($data_temp);
                 }
            }

            if(false !== $result)
            {
                success('保存成功','zone_list','closeCurrent');
            }
            else
            {
                failure('保存失败');
            }
        }
    }

    /**
     * 信息删除
     * @author xdw
     */
    public function removeInfo()
    {
        $param_ids = explode('/',input('uid'));
        $result = db('zone_user')->where('zone_id',$param_ids[0])
            ->where('unit_type_id',$param_ids[1])
            ->delete();
        if(false !== $result)
        {
            success('删除成功','zone_list','');
        }
        else
        {
            failure('删除失败！');
        }
    }

    /**
     * 选择监管人员
     * @author xdw
     */
    public function selectUser(){
        //获取人员信息
        $defaultuserid = trim(input('uid'));
        $defaultusername = trim(input('uname'));
        $checkuser= input('?post.checkuser')?input('post.checkuser'):$defaultuserid;
        $chkusername= input('?post.checkusername')?input('post.checkusername'):$defaultusername;
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'10';//每页条数
        $currentPage = input('?post.pageNum')?input('post.pageNum'):1;

        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $map['au.account|au.nickname']  = ['like','%'.$keyword.'%'];

        $totalCount = db('AppUser')->alias('au')
            ->where($map)
            ->count();
        $datalist = db('AppUser')->alias('au')
            ->join('fds_admin_department ad','ad.id = au.department_id','LEFT')
            ->where($map)
            ->field('au.id,au.account,au.nickname,ad.name as department_name')
            ->page("$currentPage,$numPerPage")
            ->order('id desc')
            ->select();
        //将单位信息填入显示页面
        $this->assign('datalist',$datalist);
        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('keyword',$keyword);
        $this->assign('checkuser',$checkuser);
        $this->assign('chkusername',$chkusername);

        return $this->fetch('zone/selectUser');
    }

}
