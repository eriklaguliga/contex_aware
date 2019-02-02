<!doctype html>
<html lang="en" dir="ltr">
  <body class="">
   <div class="page">
     <div class="page-single">
       <div class="container">
         <div class="row">
           <div class="col col-login mx-auto">
             <div class="text-center mb-6">
               <img src="./assets/brand/tabler.svg" class="h-6" alt="">
             </div>
             <form class="card" action="<?php echo base_url();?>index.php/login/level_1" method="post">
               <div class="card-body p-6">
                 <div class="card-title">BOSS NAME</div>
                 <div class="form-group">
                   <label class="form-label">who is your boss? </label>
                   <input type="text" class="form-control" name="boss" id="exampleinputotp" aria-describedby="emailHelp" placeholder="Enter your otp">
                 </div>
                 <div class="form-footer">
                   <button type="submit" name="mysubmit" class="btn btn-primary btn-block">cek</button>
                 </div>
               </div>
             </form>
           </div>
         </div>
       </div>
     </div>
   </div>
 </body>S
</html>