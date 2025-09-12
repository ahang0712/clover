; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/response-1/qwen-max/svp_simple_542_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_542_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@myglobal = common local_unnamed_addr global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @f(i32 %x) local_unnamed_addr #0 !dbg !14 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !17, metadata !DIExpression()), !dbg !18
  ret i32 5, !dbg !19
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_542_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !20 {
entry:
  %arg.addr = alloca i8*, align 8
  %tmp = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i32, i32* @myglobal, align 4, !dbg !26
  %call = call i32 @f(i32 %0), !dbg !27
  store i32 5, i32* @myglobal, align 4, !dbg !28
  %1 = load i32, i32* @myglobal, align 4, !dbg !29
  %cmp = icmp eq i32 %1, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !33, metadata !DIExpression()), !dbg !35
  store i32 1, i32* %tmp, align 4, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !37
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_542_001_main() local_unnamed_addr #0 !dbg !38 {
entry:
  %0 = load i32, i32* @myglobal, align 4, !dbg !41
  %call = call i32 @f(i32 %0), !dbg !42
  store i32 5, i32* @myglobal, align 4, !dbg !43
  %1 = load i32, i32* @myglobal, align 4, !dbg !44
  %call1 = call i32 @f(i32 %1), !dbg !45
  store i32 5, i32* @myglobal, align 4, !dbg !46
  ret i32 0, !dbg !47
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "myglobal", scope: !2, file: !6, line: 2, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_542_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/svp_simple_542_001.c", directory: "/Users/hehang03/code/clover")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{!"clang version 10.0.0 "}
!14 = distinct !DISubprogram(name: "f", scope: !6, file: !6, line: 4, type: !15, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!7, !7}
!17 = !DILocalVariable(name: "x", arg: 1, scope: !14, file: !6, line: 4, type: !7)
!18 = !DILocation(line: 4, column: 11, scope: !14)
!19 = !DILocation(line: 5, column: 3, scope: !14)
!20 = distinct !DISubprogram(name: "svp_simple_542_001_isr_1", scope: !6, file: !6, line: 7, type: !21, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!24 = !DILocalVariable(name: "arg", arg: 1, scope: !20, file: !6, line: 7, type: !23)
!25 = !DILocation(line: 7, column: 37, scope: !20)
!26 = !DILocation(line: 8, column: 16, scope: !20)
!27 = !DILocation(line: 8, column: 14, scope: !20)
!28 = !DILocation(line: 8, column: 13, scope: !20)
!29 = !DILocation(line: 9, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !6, line: 9, column: 8)
!31 = !DILocation(line: 9, column: 17, scope: !30)
!32 = !DILocation(line: 9, column: 8, scope: !20)
!33 = !DILocalVariable(name: "tmp", scope: !34, file: !6, line: 10, type: !7)
!34 = distinct !DILexicalBlock(scope: !30, file: !6, line: 9, column: 22)
!35 = !DILocation(line: 10, column: 15, scope: !34)
!36 = !DILocation(line: 11, column: 5, scope: !34)
!37 = !DILocation(line: 12, column: 1, scope: !20)
!38 = distinct !DISubprogram(name: "svp_simple_542_001_main", scope: !6, file: !6, line: 14, type: !39, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{!7}
!41 = !DILocation(line: 18, column: 16, scope: !38)
!42 = !DILocation(line: 18, column: 14, scope: !38)
!43 = !DILocation(line: 18, column: 12, scope: !38)
!44 = !DILocation(line: 19, column: 16, scope: !38)
!45 = !DILocation(line: 19, column: 14, scope: !38)
!46 = !DILocation(line: 19, column: 12, scope: !38)
!47 = !DILocation(line: 20, column: 3, scope: !38)
