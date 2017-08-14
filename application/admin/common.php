<?php
/**
 * admin 模块公共文件
 * Created by PhpStorm.
 * User: xdw
 * Date: 16-11-25
 * Time: 下午1:33
 */


/**
 * 获取在选定区域范围内的单位
 *
 * @author xdw
 * @date 20161129
 */
function get_unit(){

}

/**
 * 获取当前管理员可管理的部门id
 */
function get_admin_manage_department(){

    $admin_id = $_SESSION['fdss_session']['authId'];
    if($admin_id == 1){
        $department = db('admin_department')->field('id')->select();
    }else{
        $department = db('admin_department')->field('id')->where('admin_id',$admin_id)->select();
    }
    $department_ids = '-1';
    foreach($department as $item){
        $department_ids .= ','.$item['id'];
    }
    return $department_ids;
}

/**
 * 记录日志
 * @param $content
 * @param string $file
 */
function my_logger_2($content,$file="log.txt") {
    $base_path = rtrim($_SERVER['DOCUMENT_ROOT'],'/')."/fdss/logs/";
    $myfile = $base_path.$file;
    //echo $myfile;
    $times = date('Y-m-d H:i:s', time());
    $string = $times.'======>'.$content."\n\r";
    file_put_contents($myfile, $string , FILE_APPEND);
}

/**
 * 记录日志
 * @param $content
 * @param string $file
 */
function my_logger($content,$file="log.txt") {
    $content = json_encode($content,JSON_UNESCAPED_UNICODE);
    $base_path = rtrim($_SERVER['DOCUMENT_ROOT'],'/')."/fdss/logs/";
    $myfile = $base_path.$file;
    //echo $myfile;
    $times = date('Y-m-d H:i:s', time());
    $string = $times.'======>'.$content."\n\r";
    file_put_contents($myfile, $string , FILE_APPEND);
}

/**
 * 根据单位字段类型,转换字段值(从数据库导出)
 * @param $type
 * @param $data
 * @return false|int
 */
function changeUnitInfoData_out($type,$data){
    $temp_data = $data;
    switch ($type){
        case 'text':
            break;
        case 'texterea':
            break;
        case 'datetime':
            $temp_data = $data ? date('Y-m-d',$data) : '';
            break;
        default:;
    }
    return $temp_data;
}

/**
 * 根据单位字段类型,转换字段值（导入数据库）
 * @param $type
 * @param $data
 * @return false|int
 */
function changeUnitInfoData_in($type,$data){
    $temp_data = $data;
    switch ($type){
        case 'text':
            break;
        case 'texterea':
            break;
        case 'datetime':
            if(gettype($data)=='integer'){
                return $temp_data;
            }
            if(gettype($data)=='double'){//处理获取 excel 表格的特殊值
                $data = exceltimetophp($data);
            }
            list($year,$month,$day) = preg_split("'[\\s-,./]+'", $data);
            $data = ''.$year.'-'.$month.'-'.$day.'';
            $temp_data = strtotime($data);
            break;
        default:;
    }
    return $temp_data;
}

/**
 * 单位数据excel表 时间值转换
 * @param $days
 * @param bool $time
 * @return bool|string
 */
function exceltimetophp($days,$time=false)
{
    if(is_numeric($days))
    {
        $jd = GregorianToJD(1, 1, 1970);
        $gregorian = JDToGregorian($jd+intval($days)-25569);
        $myDate = explode('/',$gregorian);
        $myDateStr= str_pad($myDate[2],4,'0', STR_PAD_LEFT)."-".str_pad($myDate[0],2,'0',STR_PAD_LEFT)
            ."-".str_pad($myDate[1],2,'0', STR_PAD_LEFT).($time?"00:00:00":'');
        return $myDateStr;
    }
    return $time;
}



/**
 * 成功返回消息(是 dwz_jui 框架表单验证中回调函数使用参数)
 * @param $message
 * @param $navTabId
 * @param $callbackType
 * @param null $forwardUrl
 */
function success($message,$navTabId,$callbackType,$forwardUrl=null)
{
    echo '{
		"statusCode":"200",
		"message":"'.$message.'",
		"navTabId":"'.$navTabId.'",
		"rel":"",
		"callbackType":"'.$callbackType.'",
		"forwardUrl":"'.$forwardUrl.'",
		"confirmMsg":""
	}';
}

/**
 * 失败返回消息 (是 dwz_jui 框架表单验证中回调函数使用参数)
 * @param $message
 */
function failure($message)
{
    echo '{
		"statusCode":"300",
		"message":"'.$message.'",
		"navTabId":"",
		"rel":"",
		"callbackType":"",
		"forwardUrl":"",
		"confirmMsg":""
	}';
}