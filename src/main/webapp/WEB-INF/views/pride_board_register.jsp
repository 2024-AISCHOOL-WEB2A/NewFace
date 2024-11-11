<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Module &mdash; 100% Free Fully Responsive HTML5 Template by FREEHTML5.co</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
    <meta name="author" content="FREEHTML5.CO" />

    <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	-->

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content="" />
    <meta property="og:image" content="" />
    <meta property="og:url" content="" />
    <meta property="og:site_name" content="" />
    <meta property="og:description" content="" />
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'> -->

    <!-- Animate.css -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/css/bootstrap.css">
    <!-- Superfish -->
    <link rel="stylesheet" href="/css/superfish.css">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="/css/magnific-popup.css">

    <link rel="stylesheet" href="/css/style.css">
    <style>
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            font-size: 16px;
        }
        .title-input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        .submit-button, .cancel-button {
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .submit-button {
            background-color: var(--main-color);
            color: white;
        }
        .cancel-button {
            background-color: #6c757d;
            color: white;
        }
        #editor {
            margin-bottom: 20px;
        }
    </style>


    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>

    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>

<body>
    <div id="fh5co-wrapper">
        <div id="fh5co-page">
            <!--start:header-->
            <jsp:include page="common/header.jsp" />
            <!-- end:header-top -->

            <div class="container py-5 bg-light rounded shadow-sm">
                <form id="writeForm" action="/pride_board/save" method="post" enctype="multipart/form-data">
                    <div class="mb-4">
                        <h3 class="text-center">게시글 작성</h3>
                    </div>
            
                    <div class="form-group mb-3">
                        <label for="title" class="form-label">제목</label>
                        <input type="text" id="title" name="title" class="form-control" required>
                    </div>
            
                    <div class="form-group mb-3">
                        <label for="file" class="form-label">이미지 첨부</label>
                        <input type="file" id="file" name="file" class="form-control" accept="image/*">
                    </div>
            
                    <div class="form-group mb-3">
                        <label for="videoFile" class="form-label">동영상 첨부</label>
                        <input type="file" id="videoFile" name="videoFile" class="form-control" accept="video/mp4">
                    </div>
            
                    <div class="form-group mb-4">
                        <label for="editor" class="form-label">내용</label>
                        <div id="editor" class="form-control" style="height: 300px;"></div>
                        <input type="hidden" name="content" id="content">
                    </div>
            
                    <div class="d-flex justify-content-center text-center gap-2">
                        <button type="submit" class="btn btn-primary px-4">등록</button>
                        <button type="button" class="btn btn-secondary px-4" onclick="history.back()">취소</button>
                    </div>
                    
                </form>
            </div>
            



            <jsp:include page="common/footer.jsp" />
            <!-- END fh5co-page -->

        </div>

        <!-- END fh5co-wrapper -->

        <!-- jQuery -->



        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/sticky.js"></script>

        <!-- Stellar -->
        <script src="js/jquery.stellar.min.js"></script>
        <!-- Superfish -->
        <script src="js/hoverIntent.js"></script>
        <script src="js/superfish.js"></script>
        <!-- Magnific Popup -->
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/magnific-popup-options.js"></script>

        <!-- Main JS -->
        <script src="js/main.js"></script>
        <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
        <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
        <script>
            const editor = new toastui.Editor({
                el: document.querySelector('#editor'),
                height: '500px',
                initialValue: '',
                initialEditType: 'wysiwyg',
                previewStyle: 'vertical',
                language: 'ko',
                toolbarItems: [
                    ['heading', 'bold', 'italic', 'strike'],
                    ['hr', 'quote'],
                    ['ul', 'ol', 'task'],
                    ['table', 'image', 'link'],
                    ['code', 'codeblock'],
                    ['scrollSync'],
                ],
                hooks: {
                    addImageBlobHook: async (blob, callback) => {
                        const formData = new FormData();
                        formData.append('file', blob);
                        
                        try {
                            const response = await fetch('/pride_board/uploadImage', {
                                method: 'POST',
                                body: formData
                            });
                            const data = await response.json();
                            document.getElementById('file').value = data.url;
                            callback(data.url);
                        } catch (error) {
                            console.error('이미지 업로드 실패:', error);
                        }
                    }
                }
            });
        
            document.getElementById('writeForm').addEventListener('submit', function(e) {
                e.preventDefault();
                const content = editor.getHTML();
                document.getElementById('content').value = content;
                this.submit();
            });
        </script>

</body>

</html>