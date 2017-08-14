<?php
/**
 * 股室管理
 * 1、股室管理员管理
 * 2、股室管理
 *
 * @author  xdw
 * @date  20170118
 */
namespace app\admin\controller;

use \think\Db;

/**
 * 股室管理控制器
 *
 * @author  xdw
 * @date  20170118
 */
class Department extends Common
{
    /**
     * 显示股室管理信息
     *
     * @author  xdw
     * @date  20170118
     */
    public function index()
    {
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $currentPage =  input('?post.pageNum')?input('post.pageNum'):1;//当前页

        $department = db('AdminDepartment');
        $map['name']  = ['like','%'.$keyword.'%'];
        $data_count = $department->where($map)->count();
        $data_list = Db::view('AdminDepartment',['id'=>'p_id','name'=>'p_name','admin_id'])
            ->view('Admin',['id'=>'a_id','account'=>'a_account','nickname'=>'a_name'],'AdminDepartment.admin_id=Admin.id','LEFT')
            ->where($map)
            ->page("$currentPage,$numPerPage")
            ->order('AdminDepartment.id desc')
            ->select();
        $totalCount = count($data_count);//总记录数

        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('datalist',$data_list);
        $this->assign('keyword',$keyword);
        return $this->fetch('department/index');
    }

    /**
     * 新增/编辑 页面
     * @return mixed
     * @author xdw
     */
    public function edit()
    {
        $department_id = input('uid');
        $info = Db::view('AdminDepartment',['id'=>'p_id','name'=>'p_name','admin_id'])
            ->view('Admin',['id'=>'a_id','account'=>'a_account','nickname'=>'a_name'],'AdminDepartment.admin_id=Admin.id','LEFT')
            ->where('p_id',$department_id)
            ->find();
        $admins = Db::view('Admin',['id','account','nickname'])->where('account','neq','admin')->select();
        $this->assign('info',$info);
        $this->assign('admins',$admins);
        return  $this->fetch('department/edit');
    }

    /**
     * 信息保存
     * @author xdw
     */
    public function saveInfo()
    {
        $data = input('post.');
        $department = db('AdminDepartment');
        //$validate = $this->validate($data,'Article.saveinfo');
        $validate = true;

        if(true !== $validate)
        {
            $this->error($validate);
        }
        else
        {
            $department_id = input('post.id');
            if($department_id>0)//编辑
            {
                //如果帐号被修改，但与现有帐号重复，拒绝更新
                if($data['name']!=$data['p_old_name'] && ($department->where('name',$data['name'])->select()))
                {
                    failure('股室部门已存在！');
                    exit;
                }
                unset($data['p_old_name']);
                $result = $department->where('id',$department_id)->update($data);
            }
            else//新增
            {
                if($department->where('name',$data['name'])->select())
                {
                    failure('股室部门已存在！');
                    exit;
                }
                unset($data['p_old_name']);
                $result = $department->insert($data);
            }

            if(false !== $result)
            {
                success('保存成功','department_list','closeCurrent');
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
        $department = db('AdminDepartment');
        $department_id = input('uid');
        $result = $department->where('id',$department_id)->delete();
        if(false !== $result)
        {
            success('删除成功','department_list','');
        }
        else
        {
            failure('删除失败！');
        }
    }

}
