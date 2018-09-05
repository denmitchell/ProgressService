using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ProgressService {

    [ServiceBehavior(InstanceContextMode = InstanceContextMode.Single)]
    public class ProgressService : IProgressService {
        public static int Progress { get; set; }


        public int GetProgress() {
            return Progress;
        }

        public async void StartTaskAsync() {
            Progress = 0;
            var total = 15000;

            for (int i = 0; i <= total; i += 1000) {
                await Task.Delay(1000);
                Progress = (int)(100 * (i / (decimal)total));
                if (Progress > 100)
                    Progress = 100;
            }
        }

    }
}
