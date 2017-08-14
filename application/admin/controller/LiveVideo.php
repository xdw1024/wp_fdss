<?php
/**
 * 视频直播控制器
 *
 * @author  xdw
 * @date  20170328
 */
namespace app\admin\controller;

use \think\Db;
/**
 * 视频直播控制器
 *
 * @author  xdw
 * @date  20170328
 */
class LiveVideo extends Common
{

    /**
     * 直播列表
     *
     * @author  xdw
     * @date  20170328
     */
    public function index()
    {
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $currentPage =  input('?post.pageNum')?input('post.pageNum'):1;//当前页

        $map['account|nickname']  = ['like','%'.$keyword.'%'];
        $time = time() - 60*30;
        $time = 1490662936;

        $sql = 'SELECT aw.*,au.account,au.nickname,ad.`name` as department_name FROM fds_app_webrtc aw
                LEFT JOIN fds_app_user au 
                ON au.id = aw.user_id
                LEFT JOIN fds_admin_department ad 
                ON ad.id = au.department_id
                WHERE aw.time > '.$time.'
                AND ( au.account like "%'.$keyword.'%" OR au.nickname like "%'.$keyword.'%" )
                AND aw.time = (SELECT max(time) FROM fds_app_webrtc WHERE aw.user_id = user_id)
                ORDER BY aw.time desc ';
        $data_count = Db::query($sql);
        $totalCount = count($data_count);//总记录数

        $sql .= ' limit '.($currentPage-1).','.$numPerPage;
        $data_list = Db::query($sql);//分页记录集

        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('datalist',$data_list);
        $this->assign('keyword',$keyword);
        return $this->fetch('livevideo/index');
    }

}
