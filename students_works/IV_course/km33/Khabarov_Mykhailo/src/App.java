/**
 * Created by BLanDGER on 23.01.2017.
 */
public class App {

    /**
    Get user info( for login)
     */



    $query = "SELECT INTO request
            (request_usr_comment,user_login_fk,med_cert_id_fk,request_app_date) VALUES (:user_comment_bv, :user_login_bv, :med_cert_id_bv, to_date('".$app_date."','DD-MM-YYYY'))";
    $stid = oci_parse($con, $query);
    $usr_comment=$_POST['user_comment'];
    $user_login = $_SESSION['name_log'];
    oci_bind_by_name($stid, ':user_login_bv', $user_login);
    oci_bind_by_name($stid, ':user_password_bv', $usr_comment);
    $r=oci_execute($stid,OCI_NO_AUTO_COMMIT);
if(!$r){$e=oci_error($stid);
        oci_rollback($con);}
    $r=oci_commit($con);,

    /**
     Get student list
     */

    $query='SELECT r.request_id, r.request_app_date, m.med_cert_name, r.request_usr_comment,r.request_doc_comment, r.request_vizite_date FROM request r, med_cert m WHERE r.med_cert_id_fk=m.med_cert_id and r.request_id=:req_id_bv';
    $stid = oci_parse($con, $query);
    oci_bind_by_name($stid, ':phone', $req_id);
    oci_execute($stid);

    /**
     * New visiting (update visiting info)
     */
    $first="UPDATE request
    SET request_usr_comment=:user_comment_bv
    WHERE request_id=:edit_id_bv";
    $stid = oci_parse($con, $first);
    oci_bind_by_name($stid, ':amount', $user_comment_bv);
    oci_execute($stid);

    /**
    Delete visiting info
     */
    $query = 'DELETE FROM request
    WHERE request_id=:delete_value_bv';
    $stid = oci_parse($con, $query);
    oci_bind_by_name($stid, ':amount', $delete_value);
    oci_execute($stid);
}
