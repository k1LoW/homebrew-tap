class Octoslack < Formula
  desc 'octoslack is a tool for transforming HTTP requests from any webhook into Slack messages.'
  version '0.10.1'
  homepage 'https://github.com/k1LoW/octoslack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.10.1/octoslack_v0.10.1_darwin_arm64.zip'
      sha256 '764ddff91737a024399410a14929151cbe25f68f950da3bf0bce013230d89b75'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.10.1/octoslack_v0.10.1_darwin_amd64.zip'
      sha256 'bbf465d334680bbe46349f805e35958f8cee9c19196cf4e8a97404a330bd27a9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/octoslack/releases/download/v0.10.1/octoslack_v0.10.1_linux_amd64.tar.gz'
      sha256 '1251822e623356b9407f59ddeaf81a31941212067509932b526917405cfb5a4a'
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
