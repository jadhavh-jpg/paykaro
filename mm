<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PayMoney – Create Payment Link</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&family=Inter:wght@400;500&display=swap" rel="stylesheet">

<style>
:root{
  --blue:#0D3B66;
  --green:#2FB344;
  --soft:#E6F4EA;
  --dark:#062A47;
  --light:#F5F7FB;
}
*{box-sizing:border-box;margin:0;padding:0;}
body{font-family:Inter,sans-serif;background:#fff;color:#111;}
h1{font-family:Poppins;}
.container{max-width:520px;margin:40px auto;padding:20px;}

.pm-btn{
  padding:14px 26px;border-radius:10px;font-weight:600;
  border:none;cursor:pointer;text-decoration:none;
}
.pm-btn.dark{background:var(--blue);color:#fff;}
.pm-btn.soft{background:var(--soft);color:#14532D;}
.pm-btn.simple{background:#fff;border:2px solid var(--blue);color:var(--blue);}

.card{
  background:var(--light);
  padding:30px;
  border-radius:18px;
}
label{display:block;margin-top:18px;font-weight:600;}
input{
  width:100%;
  padding:12px;
  margin-top:6px;
  border-radius:8px;
  border:1px solid #d1d5db;
  font-size:16px;
}
.actions{display:flex;gap:10px;flex-wrap:wrap;margin-top:20px;}
.result{display:none;margin-top:20px;}
.link-box{
  background:#fff;
  border:1px dashed #999;
  padding:12px;
  border-radius:8px;
  word-break:break-all;
  font-size:14px;
}
.helper{font-size:13px;color:#6b7280;margin-top:6px;}
header{display:flex;justify-content:space-between;align-items:center;margin-bottom:16px;}
header span{color:var(--green);}
</style>
</head>

<body>

<div class="container">
  <header>
    <h2>Pay<span>Money</span></h2>
    <a href="index.html" class="pm-btn simple">Back</a>
  </header>

  <div class="card">
    <h1>Create Payment Link</h1>
    <p class="helper">Enter your UPI ID and amount to generate a payment link.</p>

    <label>Your UPI ID</label>
    <input type="text" id="upiId" placeholder="example@upi">

    <label>Amount (₹)</label>
    <input type="number" id="amount" placeholder="Enter amount" min="1">

    <div class="actions">
      <button class="pm-btn dark" onclick="generateLink()">Generate UPI Link</button>
      <button class="pm-btn soft" onclick="copyLink()">Copy Link</button>
      <a id="waShare" class="pm-btn simple" target="_blank">Share on WhatsApp</a>
    </div>

    <div class="result" id="result">
      <label>Your Payment Link</label>
      <div class="link-box" id="payLink"></div>
    </div>
  </div>
</div>

<script>
function generateLink(){
  const upi = document.getElementById("upiId").value.trim();
  const amt = document.getElementById("amount").value;

  if(!upi){
    alert("Please enter UPI ID");
    return;
  }
  if(!amt || amt <= 0){
    alert("Please enter valid amount");
    return;
  }

  const name = encodeURIComponent("PayMoney");
  const link = `upi://pay?pa=${upi}&pn=${name}&am=${amt}&cu=INR`;

  document.getElementById("payLink").innerText = link;
  document.getElementById("result").style.display = "block";
  document.getElementById("waShare").href =
    `https://wa.me/?text=${encodeURIComponent("Pay using this link: " + link)}`;
}

function copyLink(){
  const text = document.getElementById("payLink").innerText;
  if(!text){ alert("Generate link first"); return; }
  navigator.clipboard.writeText(text);
  alert("Payment link copied!");
}
</script>

</body>
</html>
