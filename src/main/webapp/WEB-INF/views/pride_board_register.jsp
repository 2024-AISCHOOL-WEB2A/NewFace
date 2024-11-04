<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Face - Virtual Idol Experience</title>
    <link rel="stylesheet" href="/css/styles.css">
    <!-- Toast UI Editor CSS -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
    <!--header-->
    <jsp:include page="common/header.jsp" />
    
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
</head>

<body>   
    <div class="container">
        <form id="writeForm" action="/pride_board/save" method="post" enctype="multipart/form-data">
            <br>
            <br>
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" class="title-input" required>
            </div>
            
            <div class="form-group">
                <label for="file">이미지 첨부</label>
                <input type="file" id="file" name="file" accept="image/*">
            </div>

            <div class="form-group">
                <label for="videoFile">동영상 첨부</label>
                <input type="file" id="videoFile" name="videoFile" accept="video/mp4">
            </div>
            
            <div class="form-group">
                <label for="editor">내용</label>
                <div id="editor"></div>
                <input type="hidden" name="content" id="content">
            </div>
            
            <div class="button-group">
                <button type="submit" class="submit-button">등록</button>
                <button type="button" class="cancel-button" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>

    <jsp:include page="common/footer.jsp" />
    
    <!-- Toast UI Editor JS -->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    
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

