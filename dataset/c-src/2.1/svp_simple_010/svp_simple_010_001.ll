; ModuleID = 'svp_simple_010_001.bc'
source_filename = "./svp_simple_010_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.pack1 = type { i32 }
%struct.pack2 = type { i8, i32 }

@svp_simple_010_001_global_union = common global %union.pack1 zeroinitializer, align 4
@svp_simple_010_001_global_struct = common global %struct.pack2 zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_010_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  %5 = bitcast i32* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #3, !dbg !11
  store i32 1, i32* %1, align 4, !dbg !12, !tbaa !13
  %6 = bitcast i32* %2 to i8*, !dbg !17
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #3, !dbg !17
  store i32 2, i32* %2, align 4, !dbg !18, !tbaa !13
  %7 = bitcast i32* %3 to i8*, !dbg !19
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3, !dbg !19
  store i32 3, i32* %3, align 4, !dbg !20, !tbaa !13
  %8 = bitcast i32* %4 to i8*, !dbg !21
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3, !dbg !21
  store i32 4, i32* %4, align 4, !dbg !22, !tbaa !13
  %9 = load i32, i32* %1, align 4, !dbg !23, !tbaa !13
  %10 = trunc i32 %9 to i8, !dbg !23
  store volatile i8 %10, i8* bitcast (%union.pack1* @svp_simple_010_001_global_union to i8*), align 4, !dbg !24, !tbaa !25
  %11 = load i32, i32* %2, align 4, !dbg !26, !tbaa !13
  store volatile i32 %11, i32* getelementptr inbounds (%union.pack1, %union.pack1* @svp_simple_010_001_global_union, i32 0, i32 0), align 4, !dbg !27, !tbaa !25
  %12 = load i32, i32* %3, align 4, !dbg !28, !tbaa !13
  %13 = trunc i32 %12 to i8, !dbg !28
  store volatile i8 %13, i8* getelementptr inbounds (%struct.pack2, %struct.pack2* @svp_simple_010_001_global_struct, i32 0, i32 0), align 4, !dbg !29, !tbaa !30
  %14 = load i32, i32* %4, align 4, !dbg !32, !tbaa !13
  store volatile i32 %14, i32* getelementptr inbounds (%struct.pack2, %struct.pack2* @svp_simple_010_001_global_struct, i32 0, i32 1), align 4, !dbg !33, !tbaa !34
  %15 = bitcast i32* %4 to i8*, !dbg !35
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #3, !dbg !35
  %16 = bitcast i32* %3 to i8*, !dbg !35
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #3, !dbg !35
  %17 = bitcast i32* %2 to i8*, !dbg !35
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #3, !dbg !35
  %18 = bitcast i32* %1 to i8*, !dbg !35
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #3, !dbg !35
  ret void, !dbg !35
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_010_001_isr_1() #0 !dbg !36 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void (...) @idlerun(), !dbg !37
  %3 = bitcast i32* %1 to i8*, !dbg !38
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #3, !dbg !38
  %4 = bitcast i32* %2 to i8*, !dbg !38
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !38
  %5 = load volatile i8, i8* bitcast (%union.pack1* @svp_simple_010_001_global_union to i8*), align 4, !dbg !39, !tbaa !25
  %6 = zext i8 %5 to i32, !dbg !40
  store i32 %6, i32* %1, align 4, !dbg !41, !tbaa !13
  %7 = load volatile i8, i8* getelementptr inbounds (%struct.pack2, %struct.pack2* @svp_simple_010_001_global_struct, i32 0, i32 0), align 4, !dbg !42, !tbaa !30
  %8 = zext i8 %7 to i32, !dbg !43
  store i32 %8, i32* %2, align 4, !dbg !44, !tbaa !13
  %9 = bitcast i32* %2 to i8*, !dbg !45
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #3, !dbg !45
  %10 = bitcast i32* %1 to i8*, !dbg !45
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #3, !dbg !45
  ret void, !dbg !45
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
!1 = !DIFile(filename: "svp_simple_010_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_010")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_010_001_main", scope: !8, file: !8, line: 17, type: !9, scopeLine: 17, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_010_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_010")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 18, column: 3, scope: !7)
!11 = !DILocation(line: 19, column: 3, scope: !7)
!12 = !DILocation(line: 19, column: 7, scope: !7)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 20, column: 3, scope: !7)
!18 = !DILocation(line: 20, column: 7, scope: !7)
!19 = !DILocation(line: 22, column: 3, scope: !7)
!20 = !DILocation(line: 22, column: 7, scope: !7)
!21 = !DILocation(line: 23, column: 3, scope: !7)
!22 = !DILocation(line: 23, column: 7, scope: !7)
!23 = !DILocation(line: 25, column: 44, scope: !7)
!24 = !DILocation(line: 25, column: 42, scope: !7)
!25 = !{!15, !15, i64 0}
!26 = !DILocation(line: 26, column: 42, scope: !7)
!27 = !DILocation(line: 26, column: 40, scope: !7)
!28 = !DILocation(line: 28, column: 45, scope: !7)
!29 = !DILocation(line: 28, column: 43, scope: !7)
!30 = !{!31, !15, i64 0}
!31 = !{!"pack2", !15, i64 0, !14, i64 4}
!32 = !DILocation(line: 29, column: 43, scope: !7)
!33 = !DILocation(line: 29, column: 41, scope: !7)
!34 = !{!31, !14, i64 4}
!35 = !DILocation(line: 30, column: 1, scope: !7)
!36 = distinct !DISubprogram(name: "svp_simple_010_001_isr_1", scope: !8, file: !8, line: 32, type: !9, scopeLine: 32, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 33, column: 3, scope: !36)
!38 = !DILocation(line: 34, column: 3, scope: !36)
!39 = !DILocation(line: 36, column: 45, scope: !36)
!40 = !DILocation(line: 36, column: 13, scope: !36)
!41 = !DILocation(line: 36, column: 11, scope: !36)
!42 = !DILocation(line: 38, column: 46, scope: !36)
!43 = !DILocation(line: 38, column: 13, scope: !36)
!44 = !DILocation(line: 38, column: 11, scope: !36)
!45 = !DILocation(line: 39, column: 1, scope: !36)
