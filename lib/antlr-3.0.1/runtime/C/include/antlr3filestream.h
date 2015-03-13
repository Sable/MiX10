#ifndef	_ANTLR3_FILESTREAM_H
#define	_ANTLR3_FILESTREAM_H

#include    <antlr3defs.h>

ANTLR3_API ANTLR3_FDSC	antlr3Fopen	(pANTLR3_UINT8 filename, const char * mode);
ANTLR3_API void		antlr3Fclose	(ANTLR3_FDSC fd);

ANTLR3_API ANTLR3_UINT64	antlr3Fsize	(pANTLR3_UINT8 filename);
ANTLR3_API ANTLR3_UINT64	antlr3readAscii	(pANTLR3_INPUT_STREAM input, pANTLR3_UINT8 fileName);
ANTLR3_API ANTLR3_UINT64	antlr3Fread	(ANTLR3_FDSC fdsc, ANTLR3_UINT64 count,  void * data);

#endif
