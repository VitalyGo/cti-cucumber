package cucumber.glue.domain.webManager;

import java.util.List;

public class ConsulFile {

        public boolean server;
        public int bootstrap_expect;
        public String datacenter;
        public String log_level;
        public List<String> retry_join;
        public String bind_addr;

}
