cask "mewmodoro" do
  version "1.1.4"
  sha256 "8c075f49fe21f083e14b3bfe3c778299f580535630dfd083f626dc045c9e23b5"

  url "https://github.com/Inosuke0718/mewmodoro-releases/releases/download/v#{version}/Mewmodoro-Setup-#{version}.dmg"
  name "Mewmodoro"
  desc "デスクトップ常駐ポモドーロ猫マスコット"
  homepage "https://kiki-neko.com/"

  # アプリ本体を /Applications にインストール
  app "Mewmodoro.app"

  # アンインストール時（brew uninstall）に消す関連ファイル
  zap trash: [
    "~/Library/Application Support/Mewmodoro",
    "~/Library/Preferences/com.mewmodoro.app.plist",
    "~/Library/Saved Application State/com.mewmodoro.app.savedState",
    "~/Library/Logs/Mewmodoro",
  ]
end
