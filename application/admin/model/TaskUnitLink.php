<?php
/**
 *
 * 任务单位模型
 * 参照dwz_thinkphp官方框架User模型编写，未用到方法已注释
 *
 * @author  yxf
 * @date  20161128
 */
namespace app\admin\model;

use think\Model;

/**
 *
 * 任务单位模型
 *
 * @author  yxf
 * @date  20161128
 */
class TaskUnitLink extends Model {


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