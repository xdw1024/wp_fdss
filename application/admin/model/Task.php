<?php
/**
 *
 * 任务模型
 * 参照dwz_thinkphp官方框架User模型编写，未用到方法已注释
 *
 * @author  xdw
 * @date  20161119
 */
namespace app\admin\model;

use think\Model;

/**
 *
 * 任务模型
 *
 * @author  xdw
 * @date  20161119
 */
class Task extends Model {

    /**
     * 获取任务的关联信息（包括任务的内容、任务的执行人员）
     * @param $taskid
     * @return array
     */
    public function getTaskInfo($taskid)
    {

        $result = array();
        $result['task_info'] = $this->where(['id'=>$taskid])->find();
        $result['task_contents'] = $this->getTaskUnit($taskid);
        $result['task_personnel'] = $this->getPersonnel($taskid);
        return $result;
    }

    /**
     * 获取任务相关的单位
     * @param $taskid
     * @return mixed
     */
    public function getTaskUnit($taskid)
    {
        $result = $this->alias('t')
            ->field('u.*')
            ->where(['t.id'=>$taskid])
            ->join('fds_task_unit_link tu','t.id=tu.task_id','RIGHT')
            ->join('fds_unit u','u.id=tu.unit_id')
            ->select();
        return $result;
    }

    /**
     * 获取任务分配的人员
     * @param $taskid
     * @return mixed
     */
    public function getPersonnel($taskid)
    {
        $result = $this->alias('t')
            ->field('u.*')
            ->where(['t.id'=>$taskid])
            ->join('fds_task_user_link tu','t.id=tu.task_id','RIGHT')
            ->join('fds_app_user u','u.id=tu.user_id')
            ->find();
        return $result;
    }

//	public $_validate	=	array(
//		array('account','/^[a-z]\w{3,}$/i','帐号格式错误'),
//		array('password','require','密码必须'),
//		array('nickname','require','昵称必须'),
//		array('repassword','require','确认密码必须'),
//		array('repassword','password','确认密码不一致',self::EXISTS_VALIDATE,'confirm'),
//		array('account','','帐号已经存在',self::EXISTS_VALIDATE,'unique',self::MODEL_INSERT),
//		);
//
//	public $_auto		=	array(
//		array('password','pwdHash',self::MODEL_BOTH,'callback'),
//		array('create_time','time',self::MODEL_INSERT,'function'),
//		array('update_time','time',self::MODEL_UPDATE,'function'),
//		);
//
//	protected function pwdHash() {
//		if(isset($_POST['password'])) {
//			return pwdHash($_POST['password']);
//		}else{
//			return false;
//		}
//	}
//
//    function hasRole($userId) {
//        $table = $this->tablePrefix.'role_user';
//        $rs = $this->db->query('select role_id from '.$table.' where user_id='.$userId);
//        if (isset($rs)) {
//            return true;
//        }
//        return false;
//    }
}