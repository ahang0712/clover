; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/pthread/response-1/gemini-2.5-pro/svp_simple_327_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_327_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@i = local_unnamed_addr global i32 3, align 4, !dbg !0
@j = local_unnamed_addr global i32 6, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !16 {
entry:
  %call = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !19
  ret void, !dbg !20
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_327_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !21 {
entry:
  %arg.addr = alloca i8*, align 8
  %k = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %k, metadata !27, metadata !DIExpression()), !dbg !29
  store i32 0, i32* %k, align 4, !dbg !29
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %k, align 4, !dbg !31
  %cmp = icmp slt i32 %0, 5, !dbg !33
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* @j, align 4, !dbg !35
  %add = add nsw i32 %1, 1, !dbg !37
  store i32 %add, i32* @i, align 4, !dbg !38
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %k, align 4, !dbg !40
  %inc = add nsw i32 %2, 1, !dbg !40
  store i32 %inc, i32* %k, align 4, !dbg !40
  br label %for.cond, !dbg !41, !llvm.loop !42

for.end:                                          ; preds = %for.cond
  ret void, !dbg !44
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_327_001_isr_2(i8* %arg) local_unnamed_addr #0 !dbg !45 {
entry:
  %arg.addr = alloca i8*, align 8
  %k = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %k, metadata !48, metadata !DIExpression()), !dbg !50
  store i32 0, i32* %k, align 4, !dbg !50
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %k, align 4, !dbg !52
  %cmp = icmp slt i32 %0, 5, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* @i, align 4, !dbg !56
  %add = add nsw i32 %1, 1, !dbg !58
  store i32 %add, i32* @j, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %k, align 4, !dbg !61
  %inc = add nsw i32 %2, 1, !dbg !61
  store i32 %inc, i32* %k, align 4, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_327_001_main(i32 %argc, i8** %argv) local_unnamed_addr #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %condI = alloca i32, align 4
  %condJ = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32* %condI, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = load i32, i32* @i, align 4, !dbg !78
  %cmp = icmp sgt i32 %0, 16, !dbg !79
  %conv = zext i1 %cmp to i32, !dbg !79
  store i32 %conv, i32* %condI, align 4, !dbg !77
  call void @llvm.dbg.declare(metadata i32* %condJ, metadata !80, metadata !DIExpression()), !dbg !81
  %1 = load i32, i32* @j, align 4, !dbg !82
  %cmp1 = icmp sgt i32 %1, 16, !dbg !83
  %conv2 = zext i1 %cmp1 to i32, !dbg !83
  store i32 %conv2, i32* %condJ, align 4, !dbg !81
  %2 = load i32, i32* %condI, align 4, !dbg !84
  %tobool = icmp ne i32 %2, 0, !dbg !84
  br i1 %tobool, label %if.then, label %lor.lhs.false, !dbg !86

lor.lhs.false:                                    ; preds = %entry
  %3 = load i32, i32* %condJ, align 4, !dbg !87
  %tobool3 = icmp ne i32 %3, 0, !dbg !87
  br i1 %tobool3, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %ERROR, !dbg !89

ERROR:                                            ; preds = %if.then
  call void @llvm.dbg.label(metadata !90), !dbg !92
  call void @reach_error(), !dbg !93
  call void @abort() #4, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i32, i32* %retval, align 4, !dbg !96
  ret i32 %4, !dbg !96
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "i", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_327_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "j", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_327_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{!"clang version 10.0.0 "}
!16 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 7, type: !17, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 7, column: 22, scope: !16)
!20 = !DILocation(line: 7, column: 33, scope: !16)
!21 = distinct !DISubprogram(name: "svp_simple_327_001_isr_1", scope: !8, file: !8, line: 14, type: !22, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !DILocalVariable(name: "arg", arg: 1, scope: !21, file: !8, line: 14, type: !24)
!26 = !DILocation(line: 14, column: 37, scope: !21)
!27 = !DILocalVariable(name: "k", scope: !28, file: !8, line: 15, type: !9)
!28 = distinct !DILexicalBlock(scope: !21, file: !8, line: 15, column: 3)
!29 = !DILocation(line: 15, column: 12, scope: !28)
!30 = !DILocation(line: 15, column: 8, scope: !28)
!31 = !DILocation(line: 15, column: 19, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !8, line: 15, column: 3)
!33 = !DILocation(line: 15, column: 21, scope: !32)
!34 = !DILocation(line: 15, column: 3, scope: !28)
!35 = !DILocation(line: 16, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !8, line: 15, column: 33)
!37 = !DILocation(line: 16, column: 11, scope: !36)
!38 = !DILocation(line: 16, column: 7, scope: !36)
!39 = !DILocation(line: 17, column: 3, scope: !36)
!40 = !DILocation(line: 15, column: 29, scope: !32)
!41 = !DILocation(line: 15, column: 3, scope: !32)
!42 = distinct !{!42, !34, !43}
!43 = !DILocation(line: 17, column: 3, scope: !28)
!44 = !DILocation(line: 19, column: 1, scope: !21)
!45 = distinct !DISubprogram(name: "svp_simple_327_001_isr_2", scope: !8, file: !8, line: 21, type: !22, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DILocalVariable(name: "arg", arg: 1, scope: !45, file: !8, line: 21, type: !24)
!47 = !DILocation(line: 21, column: 37, scope: !45)
!48 = !DILocalVariable(name: "k", scope: !49, file: !8, line: 22, type: !9)
!49 = distinct !DILexicalBlock(scope: !45, file: !8, line: 22, column: 3)
!50 = !DILocation(line: 22, column: 12, scope: !49)
!51 = !DILocation(line: 22, column: 8, scope: !49)
!52 = !DILocation(line: 22, column: 19, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !8, line: 22, column: 3)
!54 = !DILocation(line: 22, column: 21, scope: !53)
!55 = !DILocation(line: 22, column: 3, scope: !49)
!56 = !DILocation(line: 23, column: 9, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !8, line: 22, column: 33)
!58 = !DILocation(line: 23, column: 11, scope: !57)
!59 = !DILocation(line: 23, column: 7, scope: !57)
!60 = !DILocation(line: 24, column: 3, scope: !57)
!61 = !DILocation(line: 22, column: 29, scope: !53)
!62 = !DILocation(line: 22, column: 3, scope: !53)
!63 = distinct !{!63, !55, !64}
!64 = !DILocation(line: 24, column: 3, scope: !49)
!65 = !DILocation(line: 26, column: 1, scope: !45)
!66 = distinct !DISubprogram(name: "svp_simple_327_001_main", scope: !8, file: !8, line: 28, type: !67, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DISubroutineType(types: !68)
!68 = !{!9, !9, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !8, line: 28, type: !9)
!73 = !DILocation(line: 28, column: 33, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !8, line: 28, type: !69)
!75 = !DILocation(line: 28, column: 46, scope: !66)
!76 = !DILocalVariable(name: "condI", scope: !66, file: !8, line: 30, type: !9)
!77 = !DILocation(line: 30, column: 7, scope: !66)
!78 = !DILocation(line: 30, column: 15, scope: !66)
!79 = !DILocation(line: 30, column: 17, scope: !66)
!80 = !DILocalVariable(name: "condJ", scope: !66, file: !8, line: 31, type: !9)
!81 = !DILocation(line: 31, column: 7, scope: !66)
!82 = !DILocation(line: 31, column: 15, scope: !66)
!83 = !DILocation(line: 31, column: 17, scope: !66)
!84 = !DILocation(line: 33, column: 7, scope: !85)
!85 = distinct !DILexicalBlock(scope: !66, file: !8, line: 33, column: 7)
!86 = !DILocation(line: 33, column: 13, scope: !85)
!87 = !DILocation(line: 33, column: 16, scope: !85)
!88 = !DILocation(line: 33, column: 7, scope: !66)
!89 = !DILocation(line: 33, column: 23, scope: !85)
!90 = !DILabel(scope: !91, name: "ERROR", file: !8, line: 34)
!91 = distinct !DILexicalBlock(scope: !85, file: !8, line: 33, column: 23)
!92 = !DILocation(line: 34, column: 5, scope: !91)
!93 = !DILocation(line: 34, column: 13, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !8, line: 34, column: 12)
!95 = !DILocation(line: 34, column: 27, scope: !94)
!96 = !DILocation(line: 37, column: 1, scope: !66)
