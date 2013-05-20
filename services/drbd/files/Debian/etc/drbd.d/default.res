resource r<%= $res->{id} %> {
        protocol C;
        startup {
                wfc-timeout  15;
                degr-wfc-timeout 60;
        }
        net {
                cram-hmac-alg sha1;
                shared-secret "<%= $res->{secret} %>";
        }
<% for my $server (@{ $res->{server} }) { %>
        on <%= $server->{name} %> {
                device /dev/drbd<%= $res->{id} %>;
                disk <%= $res->{disk} %>;
                address <%= $server->{address} %>:<%= 7788 + $res->{id} %>;
                meta-disk internal;
        }
<% } %>
}
