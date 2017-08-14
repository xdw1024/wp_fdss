<?php
/**
 * 管理员控制器
 *
 * @author  xdw
 * @date  20161119
 */
namespace app\admin\controller;


/**
 * 管理员控制器
 *
 * @author  xdw
 * @date  20161119
 */
class Admin extends Common
{

    /**
     * 用户列表
     *
     * @author  xdw
     * @date  20161119
     */
    public function index()
    {
        $admin = db('Admin');
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $currentPage =  input('?post.pageNum')?input('post.pageNum'):1;//当前页

        $map['account|nickname']  = ['like','%'.$keyword.'%'];
        $map_not_admin['account']  = ['neq','admin'];
        $data_count = $admin->where($map)->where($map_not_admin)->select();
        $data_list = $admin->where($map)->where($map_not_admin)->page("$currentPage,$numPerPage")->order('id desc')->select();//分页记录集
        $totalCount = count($data_count);//总记录数

        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('datalist',$data_list);
        $this->assign('keyword',$keyword);
        return $this->fetch('admin/index');
    }

    /**
     * 新增/编辑 页面
     * @return mixed
     * @author xdw
     */
    public function edit()
    {
        $admin = db('Admin');
        $admin_id = input('uid');
        $info = $admin->where('id',$admin_id)->find();
        $this->assign('info',$info);
        return  $this->fetch('admin/edit');
    }

    /**
     * 信息保存
     * @author xdw
     */
    public function saveInfo()
    {
        $data = input('post.');
        $admin = db('Admin');
        //$validate = $this->validate($data,'Article.saveinfo');
        $validate = true;

        if(true !== $validate)
        {
            $this->error($validate);
        }
        else
        {
            $user_id = input('post.id');
            if($user_id>0)//编辑
            {
                //如果帐号被修改，但与现有帐号不重复，拒绝更新
                if($data['account']!=$data['old_account'] && ($admin->where('account',$data['account'])->select()))
                {
                    failure('账号已存在！');
                    exit;
                }
                $data['update_time'] = time();
                if($data['old_pw'] != $data['password'])//新旧密码对比
                {
                    $data['password'] = md5($data['password']);
                }
                unset($data['old_pw']);
                unset($data['old_account']);
                $result = $admin->where('id',$user_id)->update($data);
            }
            else//新增
            {
                if($admin->where('account',$data['account'])->select())
                {
                    failure('账号已存在！');
                    exit;
                }
                $data['create_time'] = time();
                $data['password'] = md5($data['password']);
                $data['status'] = 1;
                unset($data['old_pw']);
                unset($data['old_account']);
                $result = $admin->insert($data);
            }

            if(false !== $result)
            {
                success('保存成功','admin_list','closeCurrent');
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
        $admin = db('Admin');
        $admin_id = input('uid');
        $result = $admin->where('id',$admin_id)->delete();
        if(false !== $result)
        {
            success('删除成功','admin_list','');
        }
        else
        {
            failure('删除失败！');
        }
    }

}
