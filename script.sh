echo "Welcome to utilities:"
echo
echo "[0] 패키지 청소"
echo "[1] 패키지 다운"
echo "[2] 디버그 모드로 실행"
echo "[3] 라이브 모드로 실행"
echo "[4] android apk 추출"
echo "[5] android aab 추출"
echo "[6] ios 빌드"
echo "[7] ios ipa 추출"
echo
read -p "Run: " selection

case $selection in

    0)
    echo "패키지 청소"
    flutter clean
    ;;

    1)
    echo "패키지 다운"
    flutter pub get
    ;;

    2)
    echo "디버그 모드로 실행"
    flutter run -t lib/main.dart --debug
    ;;

    3)
    echo "라이브 모드로 실행"
    flutter run -t lib/main.dart --release
    ;;

    4)
    echo "android apk 추출"
    flutter build apk --release
    ;;

    5)
    echo "android aab 추출"
    flutter build appbundle --release
    ;;

    6)
    echo "ios 빌드"
    flutter build ios --release
    ;;

    7)
    echo "ios ipa 추출"
    flutter build ipa --release
    ;;

    *)
    echo "Unknown command!!"
    ;;

esac
