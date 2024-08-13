class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.11.1'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.11.1/octoslack_v0.11.1_darwin_arm64.zip'
      sha256 'cc200bc166907c222355d1d68a20a2219af22debed1caf050ca3352a7c02e2b9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.11.1/octoslack_v0.11.1_darwin_amd64.zip'
      sha256 'd2978f4a0f669e40821eb8cbca0b2f6c5aecf077f271509e910b8cb3c4f4efcd'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.11.1/octoslack_v0.11.1_linux_amd64.tar.gz'
      sha256 '2724a9b5879f8167412241af6336702f1ca24b7879dbd48fe05d0b596cc35a9e'
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
