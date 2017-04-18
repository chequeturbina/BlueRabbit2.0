/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validar() {
  
     if (document.form.password.value=='admin'){ 
        document.form.submit();
    } else {
        alert("Input OK");
    }
}