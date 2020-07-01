using ShoeStore.Application;
using ShoeStore.Implementation.Static;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoeStore.Api.Core
{
    public class AnonimousActor : IApplicationActor
    {
        public int Id => 0;

        public string Identity => "Anonymous";

        public IEnumerable<int> AllowedUseCases => RightListes.NormalRights();
    }
}
