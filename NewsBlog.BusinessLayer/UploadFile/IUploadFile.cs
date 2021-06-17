using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.UploadFile
{
    public interface IUploadFile
    {
        string Upload(IFormFile file);
    }
}
