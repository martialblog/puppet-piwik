require 'spec_helper_acceptance'

describe 'piwik' do

  context 'with defaults' do
    it 'should idempotently run' do
      pp = <<-EOS

        class { 'piwik':
         path => '/opt/piwik',
         user => 'www-data',
        }

        class { 'piwik::plugins::loginldap': }

      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end

  context 'packages installed' do
    describe package('unzip') do
      it { should be_installed }
    end
  end

  context 'files provisioned' do
    describe file('/opt/piwik/') do
      it { should be_directory }
      it { should be_owned_by 'www-data' }
    end

    describe file('/opt/piwik/piwik.php') do
      it { should be_file }
      it { should be_owned_by 'www-data' }
      it { should be_grouped_into 'www-data' }
    end
  end

  context 'loginldap plugin provisioned' do
    describe file('/opt/piwik/plugins/LoginLdap/LoginLdap.php') do
      it { should be_file }
      it { should be_owned_by 'www-data' }
      it { should be_grouped_into 'www-data' }
    end
  end

end
