class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.11.0'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.11.0/octoslack_v0.11.0_darwin_arm64.zip'
      sha256 'e74082050941305eeedc3cd2671ed0b8c304f7c245bbb986a28b17841701e313'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.11.0/octoslack_v0.11.0_darwin_amd64.zip'
      sha256 'e2ca847350b26ca5c763a3ea4a2c0030e93affde949bbfdeedd8f0616712ef26'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.11.0/octoslack_v0.11.0_linux_amd64.tar.gz'
      sha256 'c4b4d542808643f60c1e445f3590d5d70f27370ea3cb764b277320b7f6879ae1'
    end
  end

  head do
    url 'https://github.com/k1LoW/octoslack.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'octoslack'
  end
end
