; ModuleID = 'svp_simple_009_001-opt.bc'
source_filename = "./svp_simple_009_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_009_001_p = common global i32* null, align 8
@svp_simple_009_001_q = common global i32* null, align 8
@svp_simple_009_001_m = common global i32* null, align 8

; Function Attrs: nounwind uwtable
define void @svp_simple_009_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  %3 = bitcast i32* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3, !dbg !11
  store i32 1, i32* %1, align 4, !dbg !12, !tbaa !13
  %4 = bitcast i32* %2 to i8*, !dbg !17
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !17
  store i32 9, i32* %2, align 4, !dbg !18, !tbaa !13
  store i32* %1, i32** @svp_simple_009_001_p, align 8, !dbg !19, !tbaa !20
  store i32* %1, i32** @svp_simple_009_001_q, align 8, !dbg !22, !tbaa !20
  %5 = load i32*, i32** @svp_simple_009_001_p, align 8, !dbg !23, !tbaa !20
  store volatile i32 2, i32* %5, align 4, !dbg !24, !tbaa !13
  %6 = load i32*, i32** @svp_simple_009_001_p, align 8, !dbg !25, !tbaa !20
  store volatile i32 3, i32* %6, align 4, !dbg !26, !tbaa !13
  store i32* %2, i32** @svp_simple_009_001_m, align 8, !dbg !27, !tbaa !20
  %7 = load i32*, i32** @svp_simple_009_001_m, align 8, !dbg !28, !tbaa !20
  store volatile i32 6, i32* %7, align 4, !dbg !29, !tbaa !13
  %8 = load i32*, i32** @svp_simple_009_001_m, align 8, !dbg !30, !tbaa !20
  store volatile i32 6, i32* %8, align 4, !dbg !31, !tbaa !13
  %9 = bitcast i32* %2 to i8*, !dbg !32
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #3, !dbg !32
  %10 = bitcast i32* %1 to i8*, !dbg !32
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #3, !dbg !32
  ret void, !dbg !32
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_009_001_isr_1() #0 !dbg !33 {
  %1 = alloca i32, align 4
  call void (...) @idlerun(), !dbg !34
  %2 = load i32*, i32** @svp_simple_009_001_p, align 8, !dbg !35, !tbaa !20
  %3 = load volatile i32, i32* %2, align 4, !dbg !36, !tbaa !13
  %4 = bitcast i32* %1 to i8*, !dbg !37
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !37
  store i32 8, i32* %1, align 4, !dbg !38, !tbaa !13
  store i32* %1, i32** @svp_simple_009_001_m, align 8, !dbg !39, !tbaa !20
  %5 = load i32*, i32** @svp_simple_009_001_m, align 8, !dbg !40, !tbaa !20
  %6 = load volatile i32, i32* %5, align 4, !dbg !41, !tbaa !13
  %7 = bitcast i32* %1 to i8*, !dbg !42
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #3, !dbg !42
  ret void, !dbg !42
}

declare void @idlerun(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_009_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_009")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_009_001_main", scope: !8, file: !8, line: 9, type: !9, scopeLine: 9, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_009_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_009")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 10, column: 3, scope: !7)
!11 = !DILocation(line: 11, column: 3, scope: !7)
!12 = !DILocation(line: 11, column: 7, scope: !7)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 12, column: 3, scope: !7)
!18 = !DILocation(line: 12, column: 7, scope: !7)
!19 = !DILocation(line: 14, column: 24, scope: !7)
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !15, i64 0}
!22 = !DILocation(line: 15, column: 24, scope: !7)
!23 = !DILocation(line: 17, column: 4, scope: !7)
!24 = !DILocation(line: 17, column: 25, scope: !7)
!25 = !DILocation(line: 18, column: 4, scope: !7)
!26 = !DILocation(line: 18, column: 25, scope: !7)
!27 = !DILocation(line: 20, column: 24, scope: !7)
!28 = !DILocation(line: 22, column: 4, scope: !7)
!29 = !DILocation(line: 22, column: 25, scope: !7)
!30 = !DILocation(line: 23, column: 4, scope: !7)
!31 = !DILocation(line: 23, column: 25, scope: !7)
!32 = !DILocation(line: 24, column: 1, scope: !7)
!33 = distinct !DISubprogram(name: "svp_simple_009_001_isr_1", scope: !8, file: !8, line: 26, type: !9, scopeLine: 26, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!34 = !DILocation(line: 28, column: 3, scope: !33)
!35 = !DILocation(line: 29, column: 14, scope: !33)
!36 = !DILocation(line: 29, column: 13, scope: !33)
!37 = !DILocation(line: 30, column: 3, scope: !33)
!38 = !DILocation(line: 30, column: 7, scope: !33)
!39 = !DILocation(line: 31, column: 24, scope: !33)
!40 = !DILocation(line: 32, column: 14, scope: !33)
!41 = !DILocation(line: 32, column: 13, scope: !33)
!42 = !DILocation(line: 33, column: 1, scope: !33)
