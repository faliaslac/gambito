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
    public class TDMOPR_ACTIVOSController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/TDMOPR_ACTIVOS
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<TDMOPR_ACTIVOS> GetTDMOPR_ACTIVOS()
        {
            return db.TDMOPR_ACTIVOS;
        }

        // GET: api/TDMOPR_ACTIVOS/5
        [ResponseType(typeof(TDMOPR_ACTIVOS))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetTDMOPR_ACTIVOS(int id)
        {
            TDMOPR_ACTIVOS tDMOPR_ACTIVOS = db.TDMOPR_ACTIVOS.Find(id);
            if (tDMOPR_ACTIVOS == null)
            {
                return NotFound();
            }

            return Ok(tDMOPR_ACTIVOS);
        }

        // PUT: api/TDMOPR_ACTIVOS/5
        [ResponseType(typeof(void))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PutTDMOPR_ACTIVOS(int id, TDMOPR_ACTIVOS tDMOPR_ACTIVOS)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tDMOPR_ACTIVOS.Id_MOPR)
            {
                return BadRequest();
            }

            db.Entry(tDMOPR_ACTIVOS).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TDMOPR_ACTIVOSExists(id))
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

        // POST: api/TDMOPR_ACTIVOS
        [ResponseType(typeof(TDMOPR_ACTIVOS))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PostTDMOPR_ACTIVOS(TDMOPR_ACTIVOS tDMOPR_ACTIVOS)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TDMOPR_ACTIVOS.Add(tDMOPR_ACTIVOS);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (TDMOPR_ACTIVOSExists(tDMOPR_ACTIVOS.Id_MOPR))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = tDMOPR_ACTIVOS.Id_MOPR }, tDMOPR_ACTIVOS);
        }

        // DELETE: api/TDMOPR_ACTIVOS/5
        [ResponseType(typeof(TDMOPR_ACTIVOS))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult DeleteTDMOPR_ACTIVOS(int id)
        {
            TDMOPR_ACTIVOS tDMOPR_ACTIVOS = db.TDMOPR_ACTIVOS.Find(id);
            if (tDMOPR_ACTIVOS == null)
            {
                return NotFound();
            }

            db.TDMOPR_ACTIVOS.Remove(tDMOPR_ACTIVOS);
            db.SaveChanges();

            return Ok(tDMOPR_ACTIVOS);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TDMOPR_ACTIVOSExists(int id)
        {
            return db.TDMOPR_ACTIVOS.Count(e => e.Id_MOPR == id) > 0;
        }
    }
}