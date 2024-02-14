<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>code卍ninja</title>
    <!-- フォントアイコンを読み込む -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- スタイルシートを読み込む -->
    <link rel="stylesheet" href="style.css">

    <style type="text/css">
        /* Add your preferred CSS for the loading spinner */
        #loading {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 9999;
        }

        /* CSS to position A.png at the top right corner */
        #aImage {
            position: absolute;
            top: 20px; /* Adjust this value to your liking */
            right: 20px; /* Adjust this value to your liking */
            width: 50px; /* Adjust this value to your liking */
            height: auto;
            z-index: 999;
        }

        /* CSS for the rainbow glow animation */
        @keyframes rainbowGlow {
            0% { filter: hue-rotate(0deg); }
            100% { filter: hue-rotate(360deg); }
        }

        /* Apply the animation to A.png */
        #aImage.rainbow {
            animation: rainbowGlow 0.5s linear infinite;
        }
        
        #aImage {
   			width: 350px; /* 任意のサイズに調整 */
    		height: auto; /* サイズ比率を維持 */
		}
		
		
		#b-image.rainbow {
            animation: rainbowGlow 0.5s linear infinite;
        }
		#b-img-container {
            position: fixed;
            bottom: 0;
            left: 0;
            margin: 10px; /* 必要に応じて調整 */
        }
        #b-image {
            width: 400px; /* 任意のサイズに調整 */
            height: auto; /* サイズ比率を維持 */
        }
		
        
    </style>

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById('loading').style.display = "none"; // Hide the loading animation initially

            document.getElementById('custom_term1').style.display="none";
			document.getElementById('custom_term2').style.display="none";
			document.getElementById('custom_term3').style.display="none";
			document.getElementById('custom_term4').style.display="none";
			document.getElementById('custom_term5').style.display="none";
			document.getElementById('custom_term6').style.display="none";
			document.getElementById('custom_term7').style.display="none";
			document.getElementById('custom_term8').style.display="none";
			document.getElementById('custom_term9').style.display="none";
			document.getElementById('custom_term10').style.display="none";
            

            document.forms['progNumber'].addEventListener('submit', function(event) {
                event.preventDefault(); // Prevent the form from submitting in the traditional way

                // Show loading animation
                document.getElementById('loading').style.display = "block";

                // Perform AJAX request to your Servlet
                var xhr = new XMLHttpRequest();
                xhr.open(this.method, this.action, true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4) {
                        // Hide loading animation after processing
                        document.getElementById('loading').style.display = "none";

                        if (xhr.status === 200) {
                            // Handle the response if needed
                            // For example, you can update a div with the response content
                            var responseContainer = document.getElementById('responseContainer');
                            responseContainer.innerHTML = xhr.responseText;
                            responseContainer.classList.add('scale-up'); // Add the scale-up class
                        } else {
                            // Handle errors if needed
                            console.error('Error:', xhr.statusText);
                        }
                    }
                };

                xhr.send(new URLSearchParams(new FormData(this)).toString());
            });
        });

        function changeTerm(){
			let id = document.getElementById('display_term').value;
			
			if(id=='1') {
				document.getElementById('custom_term1').style.display="";
			} else {
				document.getElementById('custom_term1').style.display="none";
			}

			if(id=='2') {
				document.getElementById('custom_term2').style.display="";
			} else {
				document.getElementById('custom_term2').style.display="none";
			}
			
			if(id=='3') {
				document.getElementById('custom_term3').style.display="";
			} else {
				document.getElementById('custom_term3').style.display="none";
			}

			if(id=='4') {
				document.getElementById('custom_term4').style.display="";
			} else {
				document.getElementById('custom_term4').style.display="none";
			}

			if(id=='5') {
				document.getElementById('custom_term5').style.display="";
			} else {
				document.getElementById('custom_term5').style.display="none";
			}

			if(id=='6') {
				document.getElementById('custom_term6').style.display="";
			} else {
				document.getElementById('custom_term6').style.display="none";
			}

			if(id=='7') {
				document.getElementById('custom_term7').style.display="";
			} else {
				document.getElementById('custom_term7').style.display="none";
			}

			if(id=='8') {
				document.getElementById('custom_term8').style.display="";
			} else {
				document.getElementById('custom_term8').style.display="none";
			}

			if(id=='9') {
				document.getElementById('custom_term9').style.display="";
			} else {
				document.getElementById('custom_term9').style.display="none";
			}

			if(id=='10') {
				document.getElementById('custom_term10').style.display="";
			} else {
				document.getElementById('custom_term10').style.display="none";
			}
		}
        
    </script>
</head>
<body>

<header>
    <h1>code卍ninja</h1>
</header>

<!-- Add the loading animation div -->
<div id="loading">
    <i class="fas fa-spinner fa-spin fa-3x"></i>
</div>

<div class="container">
    <div class="jumbotron">
        <h1><i class="fas fa-search"></i> </h1>
        <h3>1988年～2020年までのデータ</h3>
        <!-- Add A.png and apply rainbow glow -->
    	<img id="aImage" src="A.png" class="rainbow">
    </div>

    <form action="./ConnectionTest" method="post" name="progNumber">
        <div>
		        <select name="dterm" id="display_term" onchange="changeTerm()">
		        	<option value="0" disabled selected hidden>選択してください</option>
		        	<option value="1">機能1</option>
					<option value="2">機能2</option>
					<option value="3">機能3</option>
					<option value="4">機能4</option>
					<option value="5">機能5</option>
					<option value="6">機能6</option>
					<option value="7">機能7</option>
					<option value="8">機能8</option>
					<option value="9">機能9</option>
					<option value="10">機能10</option>
		        </select>
		</div>
	        
	        <div id="custom_term1">
	        	<h2>年度を指定して検索(制限15万件)</h2>
	        	データ範囲 1988年1月 ～ 2020年12月<br>
	        	検索年月 (例：1988年1月の場合　→　198801)<br>
	        	<input type="number" name="from" /> から
	        	<input type="number" name="to" />まで
	        </div>
	        <div id="custom_term2">
	        	<h2>金額の高い取引順で表示</h2>
	        </div>
	        <div id="custom_term3">
	        	<h2>一番取引した国を表示</h2>
	        </div>
	        <div id="custom_term4">
	        	<h2>エリアごとの取引金額を表示</h2>
	        </div>
	        <div id="custom_term5">
	        	<h2>件数制限をかけて表示</h2>
	        </div>
	        <div id="custom_term6">
	        	<h2>輸入 / 輸出の内訳を表示</h2>
	        </div>
	        <div id="custom_term7">
	        	<h2>機能7</h2>
	        	<!-- <p><input type="checkbox" name="checked" value="desc">降順</p> -->
	        	<label><input type="radio" name="ad" value="ASC" checked="checked">昇順</label>
	        	<label><input type="radio" name="ad" value="DESC">降順</label><br>
	        	
	        	<p>国名：<input type="text" name="country_Name7"></p>
	        	検索年月(例：1988年1月の場合　→　198801)<br>
	        	<input type="text" name="searchDate">
	        </div>
	        <div id="custom_term8">
	        	<h2>選んだ項目を除外して表示</h2>
	        	都合により使えません
	        </div>
	        <div id="custom_term9">
	        	<h2>輸出額が輸入額を上回っている年度を表示</h2>
				<label><input type="radio" name="io" value="minus" checked="checked">赤字</label>
	        	<label><input type="radio" name="io" value="plus">黒字</label><br>
	        </div>
	        <div id="custom_term10">
	        	<h2>エリアごとの取引回数を表示</h2>
	        </div>

        <input type="submit" value="検索" class="smit">
    </form>
    
    <div id="b-img-container">
        	<img id="b-image" src="B.png" alt="B" class="rainbow" />
    	</div>

    <!-- Add a container to display the response from the servlet -->
    <div id="responseContainer"></div>
</div>

</body>
</html>