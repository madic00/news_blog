using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.DataTransfer
{
    public class TagDto : BaseDto
    {
        public string Name { get; set; }

        public IEnumerable<PostTagDto> PostTags { get; set; } = new List<PostTagDto>();
    }
}
