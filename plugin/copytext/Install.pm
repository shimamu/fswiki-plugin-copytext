################################################################
#
# ɽ�����Ƥ���ƥ����Ȥ򥳥ԡ����뤿��Υץ饰������󶡤��ޤ���
#
################################################################
package plugin::copytext::Install;
use strict;

sub install{
	my $wiki = shift;
	
	$wiki->add_inline_plugin("copytext", "plugin::copytext::CopyText", "HTML");
}
1;
