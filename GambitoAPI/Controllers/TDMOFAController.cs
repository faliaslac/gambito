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
    public class TDMOFAController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/TDMOFA
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<TDMOFA> GetTDMOFAs()
        {
            return db.TDMOFAs;
        }

        // GET: api/TDMOFA/5
        [ResponseType(typeof(TDMOFA))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetTDMOFA(int id)
        {
            TDMOFA tDMOFA = db.TDMOFAs.Find(id);
            if (tDMOFA == null)
            {
                return NotFound();
            }

            return Ok(tDMOFA);
        }

        // PUT: api/TDMOFA/5
        [ResponseType(typeof(void))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PutTDMOFA(int id, TDMOFA tDMOFA)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tDMOFA.IdMOFA)
            {
                return BadRequest();
            }

            db.Entry(tDMOFA).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TDMOFAExists(id))
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

        // POST: api/TDMOFA
        [ResponseType(typeof(TDMOFA))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PostTDMOFA(TDMOFA tDMOFA)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TDMOFAs.Add(tDMOFA);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tDMOFA.IdMOFA }, tDMOFA);
        }

        // DELETE: api/TDMOFA/5
        [ResponseType(typeof(TDMOFA))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult DeleteTDMOFA(int id)
        {
            TDMOFA tDMOFA = db.TDMOFAs.Find(id);
            if (tDMOFA == null)
            {
                return NotFound();
            }

            db.TDMOFAs.Remove(tDMOFA);
            db.SaveChanges();

            return Ok(tDMOFA);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TDMOFAExists(int id)
        {
            return db.TDMOFAs.Count(e => e.IdMOFA == id) > 0;
        }
    }
}