require 'spec_helper_acceptance'

describe 'piwik' do

  context 'with defaults' do
    it 'should idempotently run' do
      pp = <<-EOS
        class { 'piwik':
         path => '/opt/piwik',
         user => 'www-data',
        }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end

  context 'files provisioned' do
  end

end
