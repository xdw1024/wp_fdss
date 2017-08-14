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
class Unit extends Model {

    /**
     * 获取所有的单位信息
     * @return mixed
     */
    public function getRecordAll()
    {
        $result = $this->alias('u')
            ->field('u.*,ut.name unittype')
            ->join('fds_unit_type ut','ut.id=u.type','LEFT')
            ->select();
        return $result;
    }

    /**
     * 根据单位类型id，获取相应的单位id
     * @param $unit_type_id
     * @return false|\PDOStatement|string|\think\Collection
     */
    public function getUnitIdByTypeId($unit_type_id){
        $unit_ids = db('unit')->where('unit_type_id','in',$unit_type_id)->column('id');
        return $unit_ids;
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