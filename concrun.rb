class Concrun < Formula
  desc 'Run commands concurrently'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/concrun'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.3.0/concrun_v0.3.0_darwin_arm64.zip'
      sha256 '6de366eb370dc58dd5eb2a7f871e1b13be6a1b6983ddc9896556f72411b3fe48'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.3.0/concrun_v0.3.0_darwin_amd64.zip'
      sha256 '8f9a94cc62ec0d291bdbcc2f6e4e913ae0facb101ac4e7981df159dde461e48b'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.3.0/concrun_v0.3.0_linux_arm64.tar.gz'
      sha256 '4b796bb3309d2e79bcc0c0f59dfa6c8c71cfacc2096b3286c8ffcf23ef1c87d3'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/concrun/releases/download/v0.3.0/concrun_v0.3.0_linux_amd64.tar.gz'
      sha256 'de40e2e39a0ae965d05f95a9f22829de15cd825c63e3bb632f294e18148de2eb'
    end
  end

  head do
    url 'https://github.com/k1LoW/concrun.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'concrun'
  end
end
