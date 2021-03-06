// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package emergencia.web;

import emergencia.entidad.CentroAcopio;
import emergencia.entidad.Consejo;
import emergencia.entidad.Emergencia;
import emergencia.entidad.EmergenciaSuministro;
import emergencia.entidad.Poblacion;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.String;
import java.util.Collection;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect EmergenciaController_Roo_Controller {
    
    @Autowired
    private GenericConversionService EmergenciaController.conversionService;
    
    @RequestMapping(method = RequestMethod.POST)
    public String EmergenciaController.create(@Valid Emergencia emergencia, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("emergencia", emergencia);
            addDateTimeFormatPatterns(model);
            return "emergencias/create";
        }
        emergencia.persist();
        return "redirect:/emergencias/" + encodeUrlPathSegment(emergencia.getIdEmergencia().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String EmergenciaController.createForm(Model model) {
        model.addAttribute("emergencia", new Emergencia());
        addDateTimeFormatPatterns(model);
        return "emergencias/create";
    }
    
    @RequestMapping(value = "/{idEmergencia}", method = RequestMethod.GET)
    public String EmergenciaController.show(@PathVariable("idEmergencia") Integer idEmergencia, Model model) {
        addDateTimeFormatPatterns(model);
        model.addAttribute("emergencia", Emergencia.findEmergencia(idEmergencia));
        model.addAttribute("itemId", idEmergencia);
        return "emergencias/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String EmergenciaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("emergencias", Emergencia.findEmergenciaEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Emergencia.countEmergencias() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("emergencias", Emergencia.findAllEmergencias());
        }
        addDateTimeFormatPatterns(model);
        return "emergencias/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String EmergenciaController.update(@Valid Emergencia emergencia, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("emergencia", emergencia);
            addDateTimeFormatPatterns(model);
            return "emergencias/update";
        }
        emergencia.merge();
        return "redirect:/emergencias/" + encodeUrlPathSegment(emergencia.getIdEmergencia().toString(), request);
    }
    
    @RequestMapping(value = "/{idEmergencia}", params = "form", method = RequestMethod.GET)
    public String EmergenciaController.updateForm(@PathVariable("idEmergencia") Integer idEmergencia, Model model) {
        model.addAttribute("emergencia", Emergencia.findEmergencia(idEmergencia));
        addDateTimeFormatPatterns(model);
        return "emergencias/update";
    }
    
    @RequestMapping(value = "/{idEmergencia}", method = RequestMethod.DELETE)
    public String EmergenciaController.delete(@PathVariable("idEmergencia") Integer idEmergencia, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Emergencia.findEmergencia(idEmergencia).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/emergencias?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("centroacopios")
    public Collection<CentroAcopio> EmergenciaController.populateCentroAcopios() {
        return CentroAcopio.findAllCentroAcopios();
    }
    
    @ModelAttribute("consejoes")
    public Collection<Consejo> EmergenciaController.populateConsejoes() {
        return Consejo.findAllConsejoes();
    }
    
    @ModelAttribute("emergenciasuministroes")
    public Collection<EmergenciaSuministro> EmergenciaController.populateEmergenciaSuministroes() {
        return EmergenciaSuministro.findAllEmergenciaSuministroes();
    }
    
    @ModelAttribute("poblacions")
    public Collection<Poblacion> EmergenciaController.populatePoblacions() {
        return Poblacion.findAllPoblacions();
    }
    
    Converter<CentroAcopio, String> EmergenciaController.getCentroAcopioConverter() {
        return new Converter<CentroAcopio, String>() {
            public String convert(CentroAcopio centroAcopio) {
                return new StringBuilder().append(centroAcopio.getFechaInicio()).append(" ").append(centroAcopio.getFechaFin()).toString();
            }
        };
    }
    
    Converter<Consejo, String> EmergenciaController.getConsejoConverter() {
        return new Converter<Consejo, String>() {
            public String convert(Consejo consejo) {
                return new StringBuilder().append(consejo.getNombre()).append(" ").append(consejo.getIdResponsable()).toString();
            }
        };
    }
    
    Converter<Emergencia, String> EmergenciaController.getEmergenciaConverter() {
        return new Converter<Emergencia, String>() {
            public String convert(Emergencia emergencia) {
                return new StringBuilder().append(emergencia.getUbicacion()).append(" ").append(emergencia.getNombre()).append(" ").append(emergencia.getFechaInicio()).toString();
            }
        };
    }
    
    Converter<EmergenciaSuministro, String> EmergenciaController.getEmergenciaSuministroConverter() {
        return new Converter<EmergenciaSuministro, String>() {
            public String convert(EmergenciaSuministro emergenciaSuministro) {
                return new StringBuilder().append(emergenciaSuministro.getCantidad()).toString();
            }
        };
    }
    
    Converter<Poblacion, String> EmergenciaController.getPoblacionConverter() {
        return new Converter<Poblacion, String>() {
            public String convert(Poblacion poblacion) {
                return new StringBuilder().append(poblacion.getLugar()).append(" ").append(poblacion.getDano()).append(" ").append(poblacion.getSolucion()).toString();
            }
        };
    }
    
    @PostConstruct
    void EmergenciaController.registerConverters() {
        conversionService.addConverter(getCentroAcopioConverter());
        conversionService.addConverter(getConsejoConverter());
        conversionService.addConverter(getEmergenciaConverter());
        conversionService.addConverter(getEmergenciaSuministroConverter());
        conversionService.addConverter(getPoblacionConverter());
    }
    
    void EmergenciaController.addDateTimeFormatPatterns(Model model) {
        model.addAttribute("emergencia_fechafin_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
        model.addAttribute("emergencia_fechainicio_date_format", DateTimeFormat.patternForStyle("S-", LocaleContextHolder.getLocale()));
    }
    
    @RequestMapping(value = "/{idEmergencia}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public String EmergenciaController.showJson(@PathVariable("idEmergencia") Integer idEmergencia) {
        return Emergencia.findEmergencia(idEmergencia).toJson();
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> EmergenciaController.createFromJson(@RequestBody String json) {
        Emergencia.fromJsonToEmergencia(json).persist();
        return new ResponseEntity<String>("Emergencia created", HttpStatus.CREATED);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public String EmergenciaController.listJson() {
        return Emergencia.toJsonArray(Emergencia.findAllEmergencias());
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> EmergenciaController.createFromJsonArray(@RequestBody String json) {
        for (Emergencia emergencia: Emergencia.fromJsonArrayToEmergencias(json)) {
            emergencia.persist();
        }
        return new ResponseEntity<String>("Emergencia created", HttpStatus.CREATED);
    }
    
    private String EmergenciaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
