using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.DataTransfer
{
    public class CategoryDto : BaseDto
    {
        public string Name { get; set; }

        public IEnumerable<PostDto> Posts { get; set; } = new List<PostDto>();

    }
}
