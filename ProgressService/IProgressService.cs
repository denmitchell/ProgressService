using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace ProgressService {
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IProgressService {

        [WebInvoke(
            Method = "GET",
            BodyStyle = WebMessageBodyStyle.Bare, 
            RequestFormat = WebMessageFormat.Json, 
            ResponseFormat = WebMessageFormat.Json, 
            UriTemplate = "GetProgress")]
        [OperationContract]
        int GetProgress();

        [WebInvoke(
            Method = "POST",
            BodyStyle = WebMessageBodyStyle.Bare,
            RequestFormat = WebMessageFormat.Json,
            ResponseFormat = WebMessageFormat.Json,
            UriTemplate = "StartTask")]
        [OperationContract]
        void StartTaskAsync();

    }

}
