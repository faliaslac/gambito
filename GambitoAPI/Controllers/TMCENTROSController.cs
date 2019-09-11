using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using GambitoAPI.Models;
using System.Web.Http.Cors;

namespace GambitoAPI.Controllers
{
    public class TMCENTROSController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/TMCENTROS
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<TMCENTROS> GetTMCENTROes()
        {
            return db.TMCENTROes;
        }

        // GET: api/TMCENTROS/5
        [ResponseType(typeof(TMCENTROS))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetTMCENTROS(int id)
        {
            TMCENTROS tMCENTROS = db.TMCENTROes.Find(id);
            if (tMCENTROS == null)
            {
                return NotFound();
            }

            return Ok(tMCENTROS);
        }

        // PUT: api/TMCENTROS/5
        [ResponseType(typeof(void))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PutTMCENTROS(int id, TMCENTROS tMCENTROS)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tMCENTROS.Id_Centro)
            {
                return BadRequest();
            }

            db.Entry(tMCENTROS).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TMCENTROSExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/TMCENTROS
        [ResponseType(typeof(TMCENTROS))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PostTMCENTROS(TMCENTROS tMCENTROS)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TMCENTROes.Add(tMCENTROS);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tMCENTROS.Id_Centro }, tMCENTROS);
        }

        // DELETE: api/TMCENTROS/5
        [ResponseType(typeof(TMCENTROS))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult DeleteTMCENTROS(int id)
        {
            TMCENTROS tMCENTROS = db.TMCENTROes.Find(id);
            if (tMCENTROS == null)
            {
                return NotFound();
            }

            db.TMCENTROes.Remove(tMCENTROS);
            db.SaveChanges();

            return Ok(tMCENTROS);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TMCENTROSExists(int id)
        {
            return db.TMCENTROes.Count(e => e.Id_Centro == id) > 0;
        }
    }
}