################################################################
#
# 表示しているテキストをコピーするためのプラグインを提供します。
#
################################################################
package plugin::copytext::Install;
use strict;

sub install{
	my $wiki = shift;
	
	$wiki->add_inline_plugin("copytext", "plugin::copytext::CopyText", "HTML");
}
1;
