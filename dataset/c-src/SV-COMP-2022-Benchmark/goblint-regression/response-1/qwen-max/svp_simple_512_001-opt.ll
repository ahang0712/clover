; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/qwen-max/svp_simple_512_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_512_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@glob = common local_unnamed_addr global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [22 x i8] c"Now we do the work..n\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Work is completed...\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_512_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !14 {
entry:
  %arg.addr = alloca i8*, align 8
  %tmp = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32, i32* @glob, align 4, !dbg !22
  %add = add nsw i32 %0, 1, !dbg !23
  store i32 %add, i32* %tmp, align 4, !dbg !21
  %1 = load i32, i32* %tmp, align 4, !dbg !24
  store i32 %1, i32* @glob, align 4, !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_512_001_main() local_unnamed_addr #0 !dbg !27 {
entry:
  %i = alloca i32, align 4
  %tmp = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !DIExpression()), !dbg !31
  %call = call i32 (...) @__VERIFIER_nondet_int(), !dbg !32
  store i32 %call, i32* %i, align 4, !dbg !31
  %0 = load i32, i32* %i, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0)), !dbg !36
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* %i, align 4, !dbg !37
  %tobool2 = icmp ne i32 %1, 0, !dbg !37
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !39

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !40, metadata !DIExpression()), !dbg !42
  %2 = load i32, i32* @glob, align 4, !dbg !43
  %add = add nsw i32 %2, 1, !dbg !44
  store i32 %add, i32* %tmp, align 4, !dbg !42
  %3 = load i32, i32* %tmp, align 4, !dbg !45
  store i32 %3, i32* @glob, align 4, !dbg !46
  br label %if.end4, !dbg !47

if.end4:                                          ; preds = %if.then3, %if.end
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0)), !dbg !48
  ret i32 0, !dbg !49
}

declare i32 @__VERIFIER_nondet_int(...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "glob", scope: !2, file: !6, line: 5, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_512_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_512_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "svp_simple_512_001_isr_1", scope: !6, file: !6, line: 8, type: !15, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DILocalVariable(name: "arg", arg: 1, scope: !14, file: !6, line: 8, type: !17)
!19 = !DILocation(line: 8, column: 37, scope: !14)
!20 = !DILocalVariable(name: "tmp", scope: !14, file: !6, line: 9, type: !7)
!21 = !DILocation(line: 9, column: 7, scope: !14)
!22 = !DILocation(line: 9, column: 13, scope: !14)
!23 = !DILocation(line: 9, column: 17, scope: !14)
!24 = !DILocation(line: 10, column: 10, scope: !14)
!25 = !DILocation(line: 10, column: 8, scope: !14)
!26 = !DILocation(line: 13, column: 1, scope: !14)
!27 = distinct !DISubprogram(name: "svp_simple_512_001_main", scope: !6, file: !6, line: 15, type: !28, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!28 = !DISubroutineType(types: !29)
!29 = !{!7}
!30 = !DILocalVariable(name: "i", scope: !27, file: !6, line: 16, type: !7)
!31 = !DILocation(line: 16, column: 7, scope: !27)
!32 = !DILocation(line: 16, column: 11, scope: !27)
!33 = !DILocation(line: 17, column: 7, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !6, line: 17, column: 7)
!35 = !DILocation(line: 17, column: 7, scope: !27)
!36 = !DILocation(line: 18, column: 3, scope: !34)
!37 = !DILocation(line: 19, column: 7, scope: !38)
!38 = distinct !DILexicalBlock(scope: !27, file: !6, line: 19, column: 7)
!39 = !DILocation(line: 19, column: 7, scope: !27)
!40 = !DILocalVariable(name: "tmp", scope: !41, file: !6, line: 21, type: !7)
!41 = distinct !DILexicalBlock(scope: !38, file: !6, line: 20, column: 3)
!42 = !DILocation(line: 21, column: 11, scope: !41)
!43 = !DILocation(line: 21, column: 17, scope: !41)
!44 = !DILocation(line: 21, column: 21, scope: !41)
!45 = !DILocation(line: 22, column: 14, scope: !41)
!46 = !DILocation(line: 22, column: 12, scope: !41)
!47 = !DILocation(line: 24, column: 3, scope: !41)
!48 = !DILocation(line: 26, column: 3, scope: !27)
!49 = !DILocation(line: 28, column: 3, scope: !27)
