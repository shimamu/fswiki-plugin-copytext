####################################################################
#
# <p>�ƥ����Ȥ�ɽ���Ȥ���򥳥ԡ�����ܥ����ɽ�����ޤ���</p>
# <p>�����˥ƥ����Ȥ��Ϥ��ޤ���</p>
# <pre>
# {{copytext text}}
# </pre>
#
####################################################################
package plugin::copytext::CopyText;
use strict;

#==================================================================
# ���󥹥ȥ饯��
#==================================================================
sub new {
    my $class = shift;
    my $self = {};
    return bless $self, $class;
}

#==================================================================
# ����饤��᥽�å�
#==================================================================
sub inline {
	my $self = shift;
	my $wiki = shift;
	my $text = shift;
	my $cgi  = $wiki->get_CGI;
	my $buf  = "";
	
	if($text ne ""){
		my $id = "copytext" . int(rand(100000000000));
		my $textarea = '<textarea id="' . $id . '" class="copytext_target" readonly>' . $text . '</textarea>';
		my $script = <<"EOL";
<script type="application/javascript">
var com = {
  github: {
    shimamu: {
      fswiki: {
        plugin: {
          copyText: function() {
          ��var textarea = document.getElementById('$id');
            if("clipboard" in navigator) {
              navigator.clipboard.writeText(textarea.textContent);
            } else {
              textarea.select( ); 
              document.execCommand("copy");
            }
          }
        }
      }
    }
  }
}
</script>
EOL
                my $button = qq#<button class="copytext_button" onclick="com.github.shimamu.fswiki.plugin.copyText();">���ԡ�<\/button>#;

		$buf = '<div class="copytext">'. $textarea . $script . $button . '</div>';
	}
	
	return $buf;
}

1;
