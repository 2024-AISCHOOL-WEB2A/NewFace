<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/@mediapipe/camera_utils/camera_utils.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@mediapipe/control_utils/control_utils.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@mediapipe/drawing_utils/drawing_utils.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@mediapipe/face_mesh/face_mesh.js" crossorigin="anonymous"></script>
  <!-- <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@2.0.0/dist/tf.min.js"></script> -->
  <link href="Resources/index.css" rel="stylesheet">
  <title>TypeScript HTML App</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@ffmpeg/ffmpeg@0.10.0/dist/ffmpeg.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">



  <!-- Live2DCubismCore script -->
  <script src="./Core/live2dcubismcore.js"></script>

  <!-- Build script -->

  <script type="module" crossorigin src="/assets/index-ZSEkPd2i.js"></script>
</head>

<body>
  <!-- 슬라이드 메뉴 -->
  <div class="slide-menu" id="slide-menu">
    <button class="close-slide-button" id="close-slide-menu">X</button>
    <h2>슬라이드 메뉴</h2>

    <!-- 탭 메뉴 -->
    <div class="tab-menu">
      <button class="tab-button active" id="character-tab">캐릭터</button>
      <button class="tab-button" id="background-tab">배경</button>
    </div>

    <!-- 캐릭터 섹션 -->
    <div class="grid-section" id="character-section">
      <div class="grid-item" data-index="0">
        <img src="Resources/character_small/character_0.webp" alt="캐릭터 0">
      </div>
      <div class="grid-item" data-index="1">
        <img src="Resources/character_small/character_1.webp" alt="캐릭터 1">
      </div>
      <div class="grid-item" data-index="2">
        <img src="Resources/character_small/character_2.webp" alt="캐릭터 2">
      </div>
      <c:if test="${rentalStatus == 14}">
        <div class="grid-item" data-index="3">
          <img src="Resources/character_small/character_3.webp" alt="캐릭터 3">
        </div>
      </c:if>
      <c:if test="${rentalStatus != 14}">
        <div class="grid-item locked" data-index="3">
          <img src="Resources/character_small/character_3.webp" alt="캐릭터 3">
        </div>
      </c:if>
      <!-- 잠금 상태를 나타내는 클래스 'locked' 추가 -->
      <div class="grid-item locked" data-index="4">
        <img src="Resources/character_small/character_4.webp" alt="캐릭터 4">
      </div>
      <div class="grid-item locked" data-index="5">
        <img src="Resources/character_small/character_5.webp" alt="캐릭터 5">
      </div>
      <div class="grid-item locked" data-index="6">
        <img src="Resources/character_small/character_6.webp" alt="캐릭터 6">
      </div>
      <div class="grid-item locked" data-index="7">
        <img src="Resources/character_small/character_7.webp" alt="캐릭터 7">
      </div>
    </div>


    <!-- 배경 섹션 -->
    <div class="grid-section" id="background-section" style="display: none;">
      <!-- 흰색 배경 -->
      <div class="grid-item">
        <div class="main-background"></div>
      </div>
      <style>
        .main-background {
          background: white;
          width: 100px;
          height: 100px;
          border-radius: 8px;
        }
      </style>
      <!-- 그라데이션 배경 -->
      <div class="grid-item">
        <div class="gradient-background"></div>
      </div>

      <style>
        .gradient-background {
          background: linear-gradient(135deg, #baade6, #fbc8d4);
          width: 100px;
          height: 100px;
          border-radius: 8px;
        }
      </style>
      <div class="grid-item">
        <img src="Resources/background_small/back_gif1.webp" alt="배경 3">
      </div>
      <div class="grid-item">
        <img src="Resources/background_small/back_gif2.webp" alt="배경 4">
      </div>
      <div class="grid-item">
        <img src="Resources/background_small/back_gif3.webp" alt="배경 5">
      </div>
      <div class="grid-item">
        <img src="Resources/background_small/back_gif4.webp" alt="배경 6">
      </div>
      <div class="grid-item">
        <img src="Resources/background_small/back_gif5.webp" alt="배경 7">
      </div>
      <div class="grid-item">
        <img src="Resources/background_small/back_gif6.webp" alt="배경 8">
      </div>
    </div>

  </div>


  <!-- 왼쪽에 위치한 '>' 버튼 -->
  <button class="toggle-slide-button" id="toggle-slide-menu">
    &gt;
  </button>


  <div class="control-panel">
    <button class="control-button" id="volumeButton">
      <i class="fas fa-volume-up"></i>
    </button>
    <button class="control-button" id="microphoneButton">
      <i class="fas fa-microphone"></i>
    </button>
    <button class="control-button" id="modelSizeUpButton">
      <i class="fas fa-robot"></i>
    </button>
    <button class="control-button">
      <i class="fas fa-tv"></i>
    </button>
    <button class="control-button" id="recordButton">
      <i class="fas fa-record-vinyl"></i>
    </button>
    <button onclick="window.location.href = '/';"  class="control-button exit-button">      
      <i class="fas fa-sign-out-alt"></i>
    </button>
  </div>

  <audio id="backgroundMusic" src="Resources/background_full/background_mr.mp3" autoplay loop></audio>

  <div class="container">
    <!-- <div id="fpsDisplay">FPS: 0</div> FPS 표시 영역 -->
    <video class="input_video"></video>
    <canvas class="output_canvas" width="1280px" height="720px"></canvas>
  </div>
  <div id="tutorialModal" class="tutorial-modal hidden">
    <div class="tutorial-content">
      <img src="Resources/tutorial.jpg" alt="튜토리얼 이미지" class="tutorial-image">
  
      <!-- 하단 오른쪽의 체크박스와 닫기 버튼 -->
      <div class="tutorial-footer">
        <label>
          <input type="checkbox" id="dontShowCheckbox" > <span class="dontShow">일주일 동안 안 보기</span>
        </label>
        <button id="closeTutorial" class="close-btn">닫기</button>
      </div>
    </div>
  </div>
  



  <script>
    document.addEventListener('DOMContentLoaded', () => {
      // 요소 선택
      const slideMenu = document.getElementById('slide-menu');
      const toggleSlideMenuBtn = document.getElementById('toggle-slide-menu');
      const closeSlideMenuBtn = document.getElementById('close-slide-menu');
      const characterTab = document.getElementById('character-tab');
      const backgroundTab = document.getElementById('background-tab');
      const characterSection = document.getElementById('character-section');
      const backgroundSection = document.getElementById('background-section');
      const modelSizeUpButton = document.getElementById('modelSizeUpButton');
      const tvButton = document.querySelector('.control-button:nth-of-type(4)');
      const inputVideo = document.getElementsByClassName('input_video')[0];

      // 슬라이드 메뉴 토글 기능
      toggleSlideMenuBtn.addEventListener('click', () => {
        slideMenu.classList.toggle('show');
        toggleSlideMenuBtn.style.display = 'none';
        closeSlideMenuBtn.style.display = 'block';
        inputVideo.classList.add('hidden'); // input_video 숨기기
      });

      closeSlideMenuBtn.addEventListener('click', () => {
        slideMenu.classList.remove('show');
        closeSlideMenuBtn.style.display = 'none';
        toggleSlideMenuBtn.style.display = 'block';
      });

      // 탭 전환 기능 (캐릭터 탭과 배경 탭)
      characterTab.addEventListener('click', () => {
        characterSection.style.display = 'grid';
        backgroundSection.style.display = 'none';
      });

      backgroundTab.addEventListener('click', () => {
        characterSection.style.display = 'none';
        backgroundSection.style.display = 'grid';
      });

      // 모든 탭에 대해 클릭 이벤트 설정
      const tabs = document.querySelectorAll('.tab-button');
      tabs.forEach(tab => {
        tab.addEventListener('click', () => {
          tabs.forEach(t => t.classList.remove('active')); // 다른 탭의 활성화 상태 제거
          tab.classList.add('active'); // 현재 탭 활성화
        });
      });

      // 초기 화면 설정: 캐릭터 섹션 활성화
      characterSection.style.display = 'grid';
      backgroundSection.style.display = 'none';

      // 배경 변경 로직
      const backgrounds = [
        { type: 'color', value: 'rgb(255, 255, 255)' },
        { type: 'gradient', value: 'linear-gradient(135deg, #baade6, #fbc8d4)' },
        { type: 'image', value: 'url("Resources/background_full/back_gif1.webp")' },
        { type: 'image', value: 'url("Resources/background_full/back_gif2.webp")' },
        { type: 'image', value: 'url("Resources/background_full/back_gif3.webp")' },
        { type: 'image', value: 'url("Resources/background_full/back_gif4.webp")' },
        { type: 'image', value: 'url("Resources/background_full/back_gif5.webp")' },
        { type: 'image', value: 'url("Resources/background_full/back_gif6.webp")' }
      ];

      const backgroundItems = document.querySelectorAll('#background-section .grid-item');
      backgroundItems.forEach((item, index) => {
        item.addEventListener('click', () => {
          const background = backgrounds[index];
          if (background.type === 'color') {
            document.body.style.backgroundColor = background.value; // 색상 적용
            document.body.style.backgroundImage = 'none'; // 이미지 제거
          } else if (background.type === 'gradient') {
            document.body.style.backgroundImage = background.value; // 그라데이션 적용
            document.body.style.backgroundColor = 'transparent'; // 배경색 투명 처리
          } else if (background.type === 'image') {
            document.body.style.backgroundImage = background.value; // 이미지 적용
            document.body.style.backgroundColor = 'transparent'; // 배경색 투명 처리
          }
        });
      });
      // TV 버튼으로 비디오 표시 토글 및 아이콘 스타일 변경
      inputVideo.classList.add('hidden'); // 초기 상태에서 비디오 숨김
      // TV 버튼으로 비디오 표시 토글 및 아이콘 스타일 변경
      tvButton.addEventListener('click', () => {
        inputVideo.classList.toggle('hidden'); // 비디오 표시 토글
        const icon = tvButton.querySelector('.fa-tv');
        icon.classList.toggle('active'); // 아이콘 활성화/비활성화 토글

        // TV 버튼을 눌렀을 때 사이드바가 열려 있으면 닫기
        if (slideMenu.classList.contains('show')) { // 'show' 클래스를 확인
          slideMenu.classList.remove('show'); // 사이드바 닫기
          closeSlideMenuBtn.style.display = 'none'; // 닫기 버튼 숨기기
          toggleSlideMenuBtn.style.display = 'block'; // 열기 버튼 표시
        }
      });


    });

    // 캐릭터 변경 코드 -------------------


    document.addEventListener('DOMContentLoaded', () => {
      // 캐릭터 로드 함수
      function loadCharacter(characterIndex) {
        const live2DManager = LAppLive2DManager.getInstance();
        live2DManager.changeScene(characterIndex); // 특정 인덱스의 캐릭터를 로드
      }
    
      modelSizeUpButton.addEventListener("click", () => {
        const live2DManager = LAppLive2DManager.getInstance();
        live2DManager.isSizeUpButtonClicked = (live2DManager.isSizeUpButtonClicked + 1) % 3;
        console.log(live2DManager.isSizeUpButtonClicked);
        
      });

      // 캐릭터 섹션의 각 grid-item에 클릭 이벤트 추가
      const characterItems = document.querySelectorAll('#character-section .grid-item');
      characterItems.forEach((item) => {
        item.addEventListener('click', (event) => {
          const characterIndex = parseInt(item.getAttribute('data-index'), 10);
          loadCharacter(characterIndex); // 선택한 캐릭터 로드
        });
      });
    });

    // 음성 재생 제어
    const backgroundMusic = document.getElementById("backgroundMusic");
    const volumeButton = document.getElementById("volumeButton");
    backgroundMusic.volume = 0.1; // 배경 음악 볼륨을 낮게 설정 (10%)

    let isMuted = false;

    volumeButton.addEventListener("click", () => {
      if (isMuted) {
        backgroundMusic.play();
        volumeButton.innerHTML = '<i class="fas fa-volume-up"></i>';
      } else {
        backgroundMusic.pause();
        backgroundMusic.currentTime = 0;
        volumeButton.innerHTML = '<i class="fas fa-volume-mute"></i>';
      }
      isMuted = !isMuted;
    });

    // 마이크 음소거 제어
    const microphoneButton = document.getElementById("microphoneButton");
    let isMicMuted = false;

    microphoneButton.addEventListener("click", () => {
      isMicMuted = !isMicMuted;
      microphoneButton.innerHTML = isMicMuted
        ? '<i class="fas fa-microphone-slash"></i>'
        : '<i class="fas fa-microphone"></i>';
    });

    // 녹화 기능
    const recordButton = document.getElementById("recordButton");
    let mediaRecorder;
    let recordedChunks = [];
    let isRecording = false;

    recordButton.addEventListener("click", async () => {
      if (!isRecording) {
        try {
          // 디스플레이 및 오디오 스트림 요청
          const displayStream = await navigator.mediaDevices.getDisplayMedia({
            video: { cursor: "always" },
            audio: true, // 시스템 소리 포함
          });

          // 마이크 스트림 요청
          const audioStream = await navigator.mediaDevices.getUserMedia({
            audio: true // 마이크 권한 요청
          });

          // 마이크 음소거 상태 설정
          if (isMicMuted) {
            audioStream.getAudioTracks().forEach(track => (track.enabled = false));
          }

          // 디스플레이 및 오디오 트랙 병합
          const combinedStream = new MediaStream([
            ...displayStream.getVideoTracks(),
            ...displayStream.getAudioTracks(),
            ...audioStream.getAudioTracks(),
          ]);

          startRecording(combinedStream);
          recordButton.style.color = "red"; // 녹화 시작 시 버튼 색상 변경
        } catch (err) {
          console.error("Error accessing media devices: ", err);
        }
      } else {
        stopRecording();
      }
    });

    function startRecording(stream) {
      mediaRecorder = new MediaRecorder(stream, { mimeType: "video/webm; codecs=vp9" });
      mediaRecorder.ondataavailable = (event) => {
        if (event.data.size > 0) recordedChunks.push(event.data);
      };

      mediaRecorder.onstop = () => {
        const blob = new Blob(recordedChunks, { type: "video/webm" });
        const videoUrl = URL.createObjectURL(blob);
        const downloadLink = document.createElement("a");
        downloadLink.href = videoUrl;
        downloadLink.download = "screen_recording_with_audio.webm";
        downloadLink.click();
        recordedChunks = [];
        recordButton.style.color = ""; // 녹화 종료 시 버튼 색상 원래대로
      };

      mediaRecorder.start();
      isRecording = true;

      // 녹화가 중단되면 버튼 색상과 상태 초기화
      stream.getVideoTracks()[0].addEventListener('ended', () => {
        if (isRecording) stopRecording();
      });
    }

    function stopRecording() {
      mediaRecorder.stop();
      isRecording = false;
    }

    document.addEventListener('DOMContentLoaded', () => {
      const tutorialModal = document.getElementById('tutorialModal');
      const closeTutorial = document.getElementById('closeTutorial');
      const dontShowCheckbox = document.getElementById('dontShowCheckbox');

      // 일주일 동안 모달을 숨기기 위해 로컬 스토리지에 기록
      const hideTutorialForWeek = () => {
        const expireDate = new Date();
        expireDate.setDate(expireDate.getDate() + 7);
        localStorage.setItem('hideTutorial', expireDate.toISOString());
      };

      // 로컬 스토리지에서 튜토리얼 숨김 여부 확인
      const shouldShowTutorial = () => {
        const hideUntil = localStorage.getItem('hideTutorial');
        if (!hideUntil) return true;
        return new Date() > new Date(hideUntil); // 현재 날짜가 만료일 이후인지 확인
      };

      // 페이지 로드 시 튜토리얼 모달을 표시하거나 숨기기
      if (shouldShowTutorial()) {
        tutorialModal.classList.remove('hidden');
      }

      // 닫기 버튼 클릭 시 모달 닫기
      closeTutorial.addEventListener('click', () => {
        if (dontShowCheckbox.checked) {
          hideTutorialForWeek();
        }
        tutorialModal.classList.add('hidden');
      });
    });


  </script>



</body>

</html>
<!-- <script src="mediapipe_js.js"></script> -->
<!-- <script>

    // 프레임 계산용 변수들 선언
    const fpsDisplay = document.getElementById("fpsDisplay");  // FPS를 표시할 HTML 요소
    let lastFrameTime = performance.now();  // 마지막 프레임 시간이 기록됨
    let frameCount = 0;  // 프레임 카운터
    let fps = 0;  // FPS 계산 값

    // FPS 계산 및 표시 함수
    const calculateFPS = () => {
        const now = performance.now();  // 현재 시간 가져오기
        const delta = now - lastFrameTime;  // 현재 프레임과 이전 프레임 사이의 시간 차이 계산

        frameCount++;  // 프레임 카운터 증가
        if (delta >= 1000) {  // 1초마다 FPS를 계산
            fps = (frameCount / delta) * 1000;  // FPS 계산: 프레임 수 / 경과 시간 * 1000ms
            fpsDisplay.textContent = `FPS: ${fps.toFixed(2)}`;  // 소수점 2자리까지 표시
            frameCount = 0;  // 프레임 카운터 초기화
            lastFrameTime = now;  // 마지막 프레임 시간 업데이트
        }
    };


  </script> -->