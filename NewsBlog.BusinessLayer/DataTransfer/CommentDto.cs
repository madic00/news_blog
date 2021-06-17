using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.DataTransfer
{
    public class CommentDto : BaseDto
    {
        public string Text { get; set; }

        public int PostId { get; set; }

        public int UserId { get; set; }

        public int? ParentId { get; set; }

        public IEnumerable<CommentDto> ChildrenComments { get; set; } = new List<CommentDto>();

    }
}
